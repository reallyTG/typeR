library(drugCombo)


### Name: plot.HarbronFit
### Title: Plot method for 'HarbronFit' objects
### Aliases: plot.HarbronFit

### ** Examples

## No test: 
data("checkerboardData", package = "drugCombo")
data1 <- checkerboardData[checkerboardData$exp == 1, ]
fitUniform <- fitModel(data1, model = "uniform")
fitLinear <- fitModel(data1, model = "linear1")
plot(fitUniform, fitLinear)
plot(fitLinear, "2d")  # here 2nd argument is interpreted as `which`
## End(No test)



