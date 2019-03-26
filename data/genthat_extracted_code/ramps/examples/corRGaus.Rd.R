library(ramps)


### Name: corRGaus
### Title: Gaussian Spatial Correlation Structure
### Aliases: corRGaus
### Keywords: models

### ** Examples

sp1 <- corRGaus(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Gaus <- corRGaus(1, form = ~ x + y)
cs1Gaus <- Initialize(cs1Gaus, spatDat)
corMatrix(cs1Gaus)

cs2Gaus <- corRGaus(1, form = ~ x + y, metric = "man")
cs2Gaus <- Initialize(cs2Gaus, spatDat)
corMatrix(cs2Gaus)



