library(qgtools)


### Name: ad.simudata
### Title: An R function to generate an AD model simulated data set
### Aliases: ad.simudata
### Keywords: AD model cotton simuated data cotf2

### ** Examples

 library(qgtools)
 data(cotf2)
 Ped=cotf2[,c(1:5)]
 Y=cotf2[,-c(1:5)]
 
 YS=ad.simudata(Y,Ped,v=rep(20,7),b=c(100),SimuNum=10)
 
 ##End




