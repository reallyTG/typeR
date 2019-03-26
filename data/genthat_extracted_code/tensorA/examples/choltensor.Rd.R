library(tensorA)


### Name: chol.tensor
### Title: Cholesky decomposition of a tensor
### Aliases: chol.tensor
### Keywords: arith

### ** Examples



A <- to.tensor(rnorm(15),c(a=3,b=5))
AAt <- einstein.tensor(A,mark(A,i="a"))
ch <- chol.tensor(AAt,"a","a'",name="lambda")
#names(ch)[1]<-"lambda"
einstein.tensor(ch,mark(ch,i="a")) # AAt

A <- to.tensor(rnorm(30),c(a=3,b=5,c=2))
AAt <- einstein.tensor(A,mark(A,i="a"),by="c")
ch <- chol.tensor(AAt,"a","a'",name="lambda")
einstein.tensor(ch,mark(ch,i="a"),by="c") #AAt

	     




