library(drugCombo)


### Name: plot.tauSurface
### Title: Plot method for "tauSurface" objects
### Aliases: plot.tauSurface

### ** Examples

## No test: 
data("checkerboardData", package = "drugCombo")
data1 <- checkerboardData[checkerboardData$exp == 1, ]
fitUniform <- fitModel(data1, model = "uniform")
tauUniform <- getTauSurface(fitUniform)
fitLinear <- fitModel(data1, model = "linear1")
tauLinear <- getTauSurface(fitLinear)
plot(tauUniform)
plot(tauLinear, which = "2d", side = "d2", facetBy = "d1")
plot(tauLinear, which = "3d")
plot(tauUniform, tauLinear, tauNames = c("uniform", "linear"))
plot(tauUniform, tauLinear, continuous2 = FALSE)
## End(No test)



