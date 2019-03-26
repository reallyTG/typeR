library(MultiRNG)


### Name: draw.multinomial
### Title: Pseudo-Random Number Generation under Multivariate Multinomial
###   Distribution
### Aliases: draw.multinomial

### ** Examples

theta.vec=c(0.3,0.3,0.25,0.15) ; N=4
mydata=draw.multinomial(no.row=1e5,d=4,theta=c(0.3,0.3,0.25,0.15),N=4)
apply(mydata,2,mean)-N*theta.vec



