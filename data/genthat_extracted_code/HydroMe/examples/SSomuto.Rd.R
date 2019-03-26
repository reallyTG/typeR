library(HydroMe)


### Name: SSomuto
### Title: An Omuto water retention model
### Aliases: SSomuto
### Keywords: models manip

### ** Examples

data(isric)
isric1=isric[1:32,]
omuto=nlsList(y~SSomuto(x,ths1,alp1,ths2,alp2)|Sample, isric1)
omuto.nlme=nlme(omuto)## for fitting mixed-effects models
summary(omuto.nlme)



