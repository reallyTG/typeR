library(RPS)


### Name: resdistance_RPS
### Title: This function computes the a resistant distance between each
###   pair of matrices from the input set
### Aliases: resdistance_RPS

### ** Examples

source = array(matrix(nrow = 8,ncol = 3),c(8,3,3),dimnames = NULL)
source[,,1] <- matrix(c(3,0,0,3,0,1,3,1,1,3,1,0,0,0,0,0,0,1,0,1,1,0,1,0)
                   ,nrow = 8,ncol = 3,byrow = TRUE)
source[,,2] <- matrix(c(3, 0 ,0,3, 0, 0.5,3, 1 ,0.75,3 ,1 ,0,0 ,0 ,0,0, 0 ,1,0, 1, 1,0, 1, 0.25)
                     ,nrow = 8,ncol = 3,byrow = TRUE)
source[,,3] <- matrix(c(5, 2 ,1,3, 0, 1.5,3.4, 1 ,1.75,3 ,1 ,0,0 ,0 ,0,0, 2 ,1,0, 3, 1,0, 1, 0.75)
                     ,nrow = 8,ncol = 3,byrow = TRUE)
result <- RPS::robgit_RPS(source, consenso = FALSE)
RPS::resdistance_RPS(result)





