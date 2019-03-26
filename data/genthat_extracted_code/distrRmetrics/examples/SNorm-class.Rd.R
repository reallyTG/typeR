library(distrRmetrics)


### Name: SNorm-class
### Title: SNorm distribution
### Aliases: SNorm-class mean,SNorm-method mean<-,SNorm-method
###   nu,SNorm-method nu<-,SNorm-method sd,SNorm-method sd<-,SNorm-method
###   xi,SNorm-method xi<-,SNorm-method
### Keywords: distribution

### ** Examples

(SN <- SNorm(xi=2)) # SN is a skewed normal distribution with nu = 3.
set.seed(1)
r(SN)(1) # one random number generated from this distribution, e.g. -0.4037723
d(SN)(1) # Density of this distribution is  0.1914826 for x = 1.
p(SN)(1) # Probability that x < 1 is 0.8374454.
q(SN)(.1) # Probability that x < -1.137878 is 0.1.
## in RStudio or Jupyter IRKernel, use q.l(.)(.) instead of q(.)(.)
xi(SN) # shape of this distribution is 2.
xi(SN) <- 2.5 # shape of this distribution is now 2.5.
plot(SN)



