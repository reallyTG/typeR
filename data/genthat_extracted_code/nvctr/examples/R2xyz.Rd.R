library(nvctr)


### Name: R2xyz
### Title: Find the three rotation angles about new axes in the xyz order
###   from a rotation matrix
### Aliases: R2xyz

### ** Examples

  R_AB <- matrix(
     c( 0.9980212 ,  0.05230407, -0.0348995 ,
       -0.05293623,  0.99844556, -0.01744177,
        0.03393297,  0.01925471,  0.99923861),
     nrow = 3, ncol = 3, byrow = TRUE)
R2xyz(R_AB)




