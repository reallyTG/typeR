library(cIRT)


### Name: direct_sum
### Title: Direct Sum of Matrices
### Aliases: direct_sum

### ** Examples

x = list(matrix(0,nrow=5,ncol=3),
         matrix(1,nrow=5,ncol=3))
direct_sum(x)

x = list(matrix(rnorm(15),nrow=5,ncol=3),
         matrix(rnorm(30),nrow=5,ncol=6),
         matrix(rnorm(18),nrow=2,ncol=9))
direct_sum(x)



