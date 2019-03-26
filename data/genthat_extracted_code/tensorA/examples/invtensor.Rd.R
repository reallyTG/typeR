library(tensorA)


### Name: inv.tensor
### Title: Inversion of a tensor as linear mapping from tensors to tensors
### Aliases: inv.tensor
### Keywords: arith

### ** Examples

# SVD
# inv.tensor
R1  <- matrix(rnorm(9),nrow=3)
R1i <- solve(R1)
R2 <- to.tensor(R1,c(a=3,b=3),what=1:2)
R2i <- to.tensor(R1i,c(b=3,a=3),what=1:2)

inv.tensor(R2,"a","b") - R2i
inv.tensor(R2,"a","b",allowSingular=TRUE) - R2i

inv.tensor(rep(R2,4,1,"K"),"a","b",by="K") - rep(R2i,4,1,"K")
inv.tensor(rep(R2,4,1,"K"),"a","b",by="K",allowSingular=TRUE) - rep(R2i,4,3,"K")





