library(INLABMA)


### Name: rescalemarg
### Title: Re-scale marginal distribution to compute the distribution of
###   w*x
### Aliases: rescalemarg
### Keywords: distribution

### ** Examples


if(requireNamespace("INLA", quietly = TRUE)) {
require(INLA)
x<-seq(-3,3, by=.01)
xx<-cbind(x, dnorm(x))

xx2<-rescalemarg(xx, 3)

plot(xx, type="l", xlim=c(-9,9))
lines(xx2, col="red")
}



