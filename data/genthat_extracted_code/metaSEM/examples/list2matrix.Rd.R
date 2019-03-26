library(metaSEM)


### Name: list2matrix
### Title: Convert a List of Symmetric Matrices into a Stacked Matrix
### Aliases: list2matrix
### Keywords: utilities

### ** Examples

C1 <- matrix(c(1,0.5,0.4,0.5,1,0.2,0.4,0.2,1), ncol=3)  
C2 <- matrix(c(1,0.4,NA,0.4,1,NA,NA,NA,NA), ncol=3)  

## A list without dimension names 
list2matrix(list(C1, C2))
#      x2_x1 x3_x1 x3_x2
# [1,]   0.5   0.4   0.2
# [2,]   0.4    NA    NA

dimnames(C1) <- list( c("x","y","z"), c("x","y","z") )
dimnames(C2) <- list( c("x","y","z"), c("x","y","z") )

## A list with dimension names
list2matrix(list(C1, C2))
#      y_x z_x z_y
# [1,] 0.5 0.4 0.2
# [2,] 0.4  NA  NA



