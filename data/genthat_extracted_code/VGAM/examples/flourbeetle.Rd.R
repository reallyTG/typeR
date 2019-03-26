library(VGAM)


### Name: flourbeetle
### Title: Mortality of Flour Beetles from Carbon Disulphide
### Aliases: flourbeetle
### Keywords: datasets

### ** Examples

fit1 <- vglm(cbind(killed, exposed - killed) ~ logdose, binomialff(link = probit),
             data = flourbeetle, trace = TRUE)
summary(fit1)



