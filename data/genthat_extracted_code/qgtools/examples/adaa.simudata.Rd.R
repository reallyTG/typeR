library(qgtools)


### Name: adaa.simudata
### Title: An R function to generate an ADAA model simulated data set
### Aliases: adaa.simudata
### Keywords: ADAA model cotton simuated data cotf2

### ** Examples

 library(qgtools)
 data(cotf2)
 Ped=cotf2[,c(1:5)]
 Y=cotf2[,-c(1:5)]
 
 YS=adaa.simudata(Y,Ped,v=rep(20,9),b=c(100),SimuNum=10)
 
 ##End




