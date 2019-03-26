library(nvctr)


### Name: R_EL2n_E
### Title: Find n-vector from the rotation matrix (direction cosine matrix)
###   'R_EL'
### Aliases: R_EL2n_E

### ** Examples

R_EL <- matrix(
   c(-1, 0,  0,
      0, 1,  0,
      0, 0, -1),
   nrow = 3, ncol = 3, byrow = TRUE)
R_EL2n_E(R_EL)




