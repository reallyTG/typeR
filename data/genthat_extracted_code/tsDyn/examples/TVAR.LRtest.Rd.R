library(tsDyn)


### Name: TVAR.LRtest
### Title: Test of linearity
### Aliases: TVAR.LRtest
### Keywords: ts

### ** Examples



data(zeroyld)
data<-zeroyld

TVAR.LRtest(data, lag=2, mTh=1,thDelay=1:2, nboot=3, plot=FALSE, trim=0.1, test="1vs")



