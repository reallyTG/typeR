library(tensorA)


### Name: norm.tensor
### Title: Calculate the Euclidean norm or Euclidean operator norm of a
###   tensor or its subtensors
### Aliases: norm norm.tensor opnorm opnorm.tensor
### Keywords: algebra

### ** Examples

C <- to.tensor(1:20,c(A=4,B=5))
norm(C,"A")
norm(C,2)
norm(C,c("A","B"))
opnorm(C,"A")



