library(ramps)


### Name: corRSpher
### Title: Spherical Spatial Correlation Structure
### Aliases: corRSpher
### Keywords: models

### ** Examples

sp1 <- corRSpher(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Spher <- corRSpher(1, form = ~ x + y)
cs1Spher <- Initialize(cs1Spher, spatDat)
corMatrix(cs1Spher)

cs2Spher <- corRSpher(1, form = ~ x + y, metric = "man")
cs2Spher <- Initialize(cs2Spher, spatDat)
corMatrix(cs2Spher)



