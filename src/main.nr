fn main(solution : [Field; 81], filled_blocks : [Field; 81]) {
    for idx in 0..81 {
        if filled_blocks[idx] != 0 {
            constrain filled_blocks[idx] == solution[idx];
        }
    }

    for row in 0..9 {
        
        let mut row_contraints = [0, 0, 0, 0, 0, 0, 0, 0, 0];

        for col in 0..9 {
            let elem_idx = row * 9 + col;
            let elem = solution[elem_idx];

            for idx in 0..9 {
                if idx == elem - 1 {
                    row_contraints[idx] = 1;
                }
            }
        }

        let all = row_contraints.all(|a| a == 1);
        constrain all;
    }

    for col in 0..9 {
        
        let mut col_contraints = [0, 0, 0, 0, 0, 0, 0, 0, 0];

        for row in 0..9 {
            let elem_idx = row * 9 + col;
            let elem = solution[elem_idx];

            for idx in 0..9 {
                if idx == elem - 1 {
                    col_contraints[idx] = 1;
                }
            }
        }

        let all = col_contraints.all(|a| a == 1);
        constrain all;
    }

    let mut sub_matrix_row_mover = 0;
    let mut sub_matrix_col_mover = 0;

    for i in 0..3 {
        let mut sub_matrix_contraints = [0, 0, 0, 0, 0, 0, 0, 0, 0];

        for row in sub_matrix_row_mover..sub_matrix_row_mover+3 {
            for col in sub_matrix_col_mover..sub_matrix_col_mover+3 {
                let elem_idx = row * 9 + col;
                let elem = solution[elem_idx];

                for idx in 0..9 {
                    if idx == elem - 1 {
                        sub_matrix_contraints[idx] = 1;
                    }
                }
            }
        }

        let all = sub_matrix_contraints.all(|a| a == 1);
        
        constrain all;

        sub_matrix_row_mover += 3 * i;
        sub_matrix_col_mover += 3 * i;
    }
    
}