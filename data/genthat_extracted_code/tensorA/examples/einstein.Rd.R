library(tensorA)


### Name: einstein.tensor
### Title: Tensor multiplication with Einstein's convention, by summing
###   over all equally named indices.
### Aliases: einstein.tensor %e% %e%.tensor
### Keywords: arith

### ** Examples

A <- to.tensor(1:20,c(U=2,V=2,W=5))
B <- to.tensor(1:30,list(U=c("a","b","c"),V=c("B1","B2"),W=1:5))
einstein.tensor(A,U="U'",B)
einstein.tensor(A,U="U'",mark(B,"k"))
einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk")
einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk",1/10)
einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk",diag=to.tensor(c(1,1/10,1/100),c(Uk=3)))

ftable(einstein.tensor(A,U="U'",B))
ftable(einstein.tensor(A,U="U'",mark(B,"k")))
ftable(einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk"))
ftable(einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk",1/10))
ftable(einstein.tensor(A,U="U'",mark(B,"k"),V="Vk",W="Wk",diag=to.tensor(c(1,1/10,1/100),c(Uk=3))))

dim(A[[U=~M]])
A[[U=~M]] 
A[[U=~M,V=~"L"]] 




