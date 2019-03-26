library(frt)


### Name: concat
### Title: Combine rows of two input matrices
### Aliases: concat
### Keywords: utilities

### ** Examples

m1 <- matrix(1:6, nrow=2, ncol=3)
print(m1)
m2 <- matrix(c(0,0,0,1,1,0,1,1), nrow=4, ncol=2)
print(m2)
concat(m1,m2) 



