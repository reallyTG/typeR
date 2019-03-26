library(car)


### Name: regLine
### Title: Plot Regression Line
### Aliases: regLine
### Keywords: aplot

### ** Examples

plot(repwt ~ weight, pch=c(1,2)[sex], data=Davis)
regLine(lm(repwt~weight, subset=sex=="M", data=Davis))
regLine(lm(repwt~weight, subset=sex=="F", data=Davis), lty=2)



