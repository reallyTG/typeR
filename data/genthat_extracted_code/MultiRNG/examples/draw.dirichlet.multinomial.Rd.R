library(MultiRNG)


### Name: draw.dirichlet.multinomial
### Title: Pseudo-Random Number Generation under Dirichlet-Multinomial
###   Distribution
### Aliases: draw.dirichlet.multinomial

### ** Examples

alpha.vec=c(1,3,4,4) ; N=3
mydata=draw.dirichlet.multinomial(no.row=1e5,d=4,alpha=alpha.vec,beta=2, N=3)
apply(mydata,2,mean)-N*alpha.vec/sum(alpha.vec)



