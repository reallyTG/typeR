library(distrRmetrics)


### Name: SSTd-class
### Title: SSTd distribution
### Aliases: SSTd-class mean,SSTd-method mean<-,SSTd-method nu nu-methods
###   nu<- nu<--methods nu,SSTd-method nu<-,SSTd-method sd,SSTd-method
###   sd<-,SSTd-method xi xi-methods xi<- xi<--methods xi,SSTd-method
###   xi<-,SSTd-method
### Keywords: distribution

### ** Examples

(ST <- SSTd(xi=2, nu = 3)) # ST is a skewed t distribution with xi = 2 and nu = 3.
set.seed(1)
r(ST)(1) # one random number generated from this distribution, e.g. -0.4432824
d(ST)(1) # Density of this distribution is 0.1204624 for x = 1.
p(ST)(1) # Probability that x < 1 is 0.9035449.
q(ST)(.1) # Probability that x < -0.4432824 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
nu(ST) # df of this distribution is 3.
nu(ST) <- 4 # df of this distribution is now 4.
plot(ST)



