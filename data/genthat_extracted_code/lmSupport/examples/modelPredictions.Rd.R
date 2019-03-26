library(lmSupport)


### Name: modelPredictions
### Title: Provides predicted values for sample or new data.  New
###   predictions include SEs
### Aliases: modelPredictions
### Keywords: regression

### ** Examples

##NOT RUN
##make plot of predicted values with 1SE error bands for CAN
##m = lm(interlocks~assets+nation, data=Ornstein) 
##dNew = data.frame(assets = seq(1000,100000, by=1000),nation='CAN') 
##dNew = modelPredictions(m, dNew)
##plot(dNew$assets,dNew$Predicted, type = 'l', col= 'red')
##lines(dNew$assets,dNew$CILo, type = 'l', col= 'gray', lwd =.5)
##lines(dNew$assets,dNew$CIHi, type = 'l', col= 'gray', lwd =.5)

##Return predicted values for sample
##P = modelPredictions(m)



