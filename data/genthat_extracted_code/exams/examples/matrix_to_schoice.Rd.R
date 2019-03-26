library(exams)


### Name: matrix_to_schoice
### Title: Generate Single- and Multiple-Choice Question Lists for Matrix
###   Solutions
### Aliases: matrix2schoice matrix_to_schoice matrix2mchoice
###   matrix_to_mchoice det2schoice det_to_schoice
### Keywords: utilities

### ** Examples

A <- matrix(c(-9, 0, 5, -2), ncol = 2)
matrix_to_schoice(A)
matrix_to_mchoice(A)
det_to_schoice(A)

B <- matrix(1:9, ncol = 3)
matrix_to_schoice(B)
matrix_to_mchoice(B)



