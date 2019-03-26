library(tensorA)


### Name: solve.tensor
### Title: Solving linear equations with tensors
### Aliases: solve.tensor
### Keywords: arith

### ** Examples

R1  <- matrix(rnorm(9),nrow=3)
R1i <- solve(R1)
R2 <- to.tensor(R1,c(a=3,b=3),what=1:2)
R2i <- to.tensor(R1i,c(b=3,a=3),what=1:2)

inv.tensor(R2,"a","b") - R2i
inv.tensor(R2,"a","b",allowSingular=TRUE) - R2i

inv.tensor(rep(R2,4,1,"K"),"a","b",by="K") - rep(R2i,4,1,"K")
inv.tensor(rep(R2,4,1,"K"),"a","b",by="K",allowSingular=TRUE) - rep(R2i,4,3,"K")

R3 <- to.tensor(rnorm(15),c(a=3,z=5))

mul.tensor(R2i,"b",mul.tensor(R2,"a",R3)) # R3

solve.tensor(R2i,R3[[z=1]],"a")
mul.tensor(R2,"a",R3[[z=1]])

solve.tensor(R2i,R3,"a")
mul.tensor(R2,"a",R3)

solve.tensor(R2i,R3[[z=1]],"a",allowSingular=TRUE)
mul.tensor(R2,"a",R3[[z=1]])

solve.tensor(R2i,R3,"a",allowSingular=TRUE)
mul.tensor(R2,"a",R3)

solve.tensor(rep(R2i,4,1,"K"),R3[[z=1]],"a",by="K")
rep(mul.tensor(R2,"a",R3[[z=1]]),4,1,"K")

solve.tensor(rep(R2i,4,1,"K"),rep(R3[[z=1]],4,1,"K"),"a",by="K")
rep(mul.tensor(R2,"a",R3[[z=1]]),4,1,"K")




