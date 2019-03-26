library(ldbounds)


### Name: drift
### Title: Drift and Probabilities for Group Sequential Boundaries
### Aliases: drift
### Keywords: misc

### ** Examples

   ## From Reboussin, et al. (2000)

   t <- c(0.13,0.4,0.69,0.9,0.98,1)
   upper <- c(5.3666,3.7102,2.9728,2.5365,2.2154,1.9668)
   drift.pr <- drift(zb=upper,t=t,drft=3.242)
   summary(drift.pr)

   t <- c(0.2292,0.3333,0.4375,0.5833,0.7083,0.8333)
   upper <- c(2.53,2.61,2.57,2.47,2.43,2.38)
   drift.ci <- drift(zb=upper,t=t,conf=0.95,zval=2.82)
   summary(drift.ci)
   plot(drift.ci)

   ## Using output from 'bounds'
   t <- seq(0.2,1,length=5)
   obf.bd <- bounds(t,iuse=c(1,1),alpha=c(0.025,0.025))
   drift.dr <- drift(obf.bd$lower.bounds,obf.bd$upper.bounds,t,pow=0.9)
   summary(drift.dr)







