library(ludic)


### Name: em_winkler
### Title: Implementation of Winkler's EM algorithm for Fellegi-Sunter
###   matching method
### Aliases: em_winkler em_winkler_big

### ** Examples

mat1 <- matrix(round(rnorm(n=1000, sd=1.2)), ncol=10, nrow=100)
mat2 <- rbind(mat1[1:10, ],
             matrix(round(rnorm(n=900, sd=1.2)), ncol=10, nrow=90)
             )
rownames(mat1) <- paste0("A", 1:nrow(mat1))
rownames(mat1) <- paste0("B", 1:nrow(mat1))
mat1 <- 1*(mat1>1)
mat2 <- 1*(mat2>1)
em_winkler(mat1, mat2)




