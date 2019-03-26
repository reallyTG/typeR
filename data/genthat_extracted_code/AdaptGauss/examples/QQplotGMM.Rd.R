library(AdaptGauss)


### Name: QQplotGMM
### Title: Quantile Quantile Plot of Data
### Aliases: QQplotGMM

### ** Examples


data=c(rnorm(1000),rnorm(2000)+2,rnorm(1000)*2-1)
QQplotGMM(data,c(-1,0,2),c(2,1,1),c(0.25,0.25,0.5))



