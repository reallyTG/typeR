library(latentnet)


### Name: control.ergmm
### Title: Auxiliary for Controlling ERGMM Fitting
### Aliases: control.ergmm ergmm.control
### Keywords: graphs misc

### ** Examples


## No test: 
data(sampson)
## Shorter run than default.
samp.fit<-ergmm(samplike~euclidean(d=2,G=3)+rreceiver,
control=ergmm.control(burnin=1000,sample.size= 2000,interval=5))
## End(No test)




