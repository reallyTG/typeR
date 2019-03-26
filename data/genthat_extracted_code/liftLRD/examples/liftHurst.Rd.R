library(liftLRD)


### Name: liftHurst
### Title: Performs (non-decimated) lifting based estimation of the Hurst
###   exponent
### Aliases: liftHurst
### Keywords: manip regression ts

### ** Examples


library(fracdiff)

# simulate a long range dependent time series
x<-fracdiff.sim(n = 200, d = 0.3)$series

# perform lifting-based estimation of the Hurst exponent

Hestx<-liftHurst(x, tradonly=TRUE)

# An example with missingness
x1<-fracdiff.sim(n = 500, d = 0.3)$series
gap1<-30:40
gap2<-77:90
gap3<-146:166
timeindex<-setdiff(1:500,c(gap1,gap2,gap3))

Hestx1<-liftHurst(x1[timeindex],grid=timeindex, tradonly=TRUE)





