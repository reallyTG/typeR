library(matsbyname)


### Name: complete_rows_cols
### Title: Complete rows and columns in one matrix relative to another
### Aliases: complete_rows_cols

### ** Examples

m1 <- matrix(c(1:6), nrow=3, dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
m2 <- matrix(c(7:12), ncol=3, dimnames = list(c("r2", "r3"), c("c2", "c3", "c4")))
complete_rows_cols(m1, m2) # Adds empty column c4
complete_rows_cols(m1, t(m2)) # Creates r2, r3 columns; c2, c3, c4 rows
complete_rows_cols(m1, m2, margin = 1) # No changes because r2 and r3 already present in m1
complete_rows_cols(m1, m2, margin = 2) # Adds empty columns c3 and c4
complete_rows_cols(m1, t(m2), margin = 1) # Adds empty rows c2, c3, c4
complete_rows_cols(m1, m2, fill = 100) # Adds columns c3 and c4 with 100's
complete_rows_cols(m1, m1) # Nothing added, because everything already present
complete_rows_cols(m1, t(m1)) # Adds empty c1, c2 rows; Adds empty r1, r2, r3 columns
# Same as previous. With missing matrix, complete relative to transpose of m1.
complete_rows_cols(m1) 
# Adds rows r10, r11; cols c10, c11
complete_rows_cols(m1, matrix(0, nrow = 2, ncol = 2, 
                              dimnames = list(c("r10", "r11"), c("c10", "c11")))) 
# Also works with lists
complete_rows_cols(a = list(m1,m1))
complete_rows_cols(a = list(m1,m1), mat = list(m2,m2))
# No changes because r2, r3 already present in m1
complete_rows_cols(a = list(m1,m1), mat = list(m2,m2), margin = 1) 
complete_rows_cols(a = list(m1,m1), mat = list(m2,m2), margin = 2)
complete_rows_cols(a = list(m1,m1), 
                   mat = make_list(matrix(0, nrow = 2, ncol = 2, 
                                          dimnames = list(c("r10", "r11"), c("c10", "c11"))), 
                                   n = 2, lenx = 1))
# fillrow or fillcol can be specified
a <- matrix(c(11, 12, 21, 22), byrow = TRUE, nrow = 2, ncol = 2, 
            dimnames = list(c("r1", "r2"), c("c1", "c2")))
b <- matrix(c(1:6), byrow = TRUE, nrow = 3, ncol = 2, 
            dimnames = list(c("r1", "r2", "r3"), c("c1", "c2")))
fillrow <- matrix(c(31, 32), byrow = TRUE, nrow = 1, ncol = 2, 
                  dimnames = list("r42", c("c1", "c2")))
complete_rows_cols(a = a, mat = b, fillrow = fillrow)



