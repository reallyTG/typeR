library(aurelius)


### Name: pfa.forecast
### Title: PFA Formatting of Time Series Models Fit using Forecast Package
### Aliases: pfa.forecast

### ** Examples

model1 <- forecast::holt(airmiles)
model1_as_pfa <- pfa(model1)

model2 <- forecast::hw(USAccDeaths,h=48)
model2_as_pfa <- pfa(model2)

model3 <- forecast::ses(LakeHuron)
model3_as_pfa <- pfa(model3)



