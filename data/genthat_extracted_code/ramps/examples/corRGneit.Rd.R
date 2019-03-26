library(ramps)


### Name: corRGneit
### Title: Gneiting Spatial Correlation Structure
### Aliases: corRGneit
### Keywords: models

### ** Examples

sp1 <- corRGneit(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Gneit <- corRGneit(1, form = ~ x + y)
cs1Gneit <- Initialize(cs1Gneit, spatDat)
corMatrix(cs1Gneit)

cs2Gneit <- corRGneit(1, form = ~ x + y, metric = "man")
cs2Gneit <- Initialize(cs2Gneit, spatDat)
corMatrix(cs2Gneit)



