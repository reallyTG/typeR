library(qgtools)


### Name: adm.simudata
### Title: An R function to generate an ADM model simulated data set
### Aliases: adm.simudata
### Keywords: ADM model cotton simuated data cotf2

### ** Examples

library(qgtools)
 data(cotf2)
 Ped=cotf2[,c(1:5)]
 Y=cotf2[,-c(1:5)]
 
 YS=adm.simudata(Y,Ped,v=rep(20,11),b=c(100))
 
 ##End




