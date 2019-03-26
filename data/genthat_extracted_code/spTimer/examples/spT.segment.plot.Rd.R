library(spTimer)


### Name: spT.segment.plot
### Title: Utility plot for prediction/forecast
### Aliases: spT.segment.plot
### Keywords: utility

### ** Examples

##

obs<-rnorm(10,15,1)
est<-rnorm(10,15,1.5)
up<-rnorm(10,25,0.5)
low<-rnorm(10,5,0.5)
spT.segment.plot(obs,est,up,low,limit=c(0,30)) 

##



