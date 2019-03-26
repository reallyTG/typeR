library(TeachingDemos)


### Name: hpd
### Title: Compute Highest Posterior Density Intervals
### Aliases: hpd emp.hpd
### Keywords: univar

### ** Examples


hpd(qbeta, shape1=50, shape2=250)

tmp <- rbeta(10000, 50, 250)
emp.hpd(tmp)




