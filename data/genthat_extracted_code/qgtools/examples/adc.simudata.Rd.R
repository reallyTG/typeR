library(qgtools)


### Name: adc.simudata
### Title: An R function to generate an ADC model simulated data set
### Aliases: adc.simudata
### Keywords: ADC model cotton simuated data cotf2

### ** Examples

library(qgtools)
 data(cotf2)
 Ped=cotf2[,c(1:5)]
 Y=cotf2[,-c(1:5)]
 
 YS=adc.simudata(Y,Ped,v=rep(20,9),b=c(100))
 
 ##End




