library(ramps)


### Name: corRMatern
### Title: Matern Spatial Correlation Structure
### Aliases: corRMatern
### Keywords: models

### ** Examples

sp1 <- corRMatern(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Matern <- corRMatern(c(1, 1), form = ~ x + y)
cs1Matern <- Initialize(cs1Matern, spatDat)
corMatrix(cs1Matern)

cs2Matern <- corRMatern(c(1, 1), form = ~ x + y, metric = "man")
cs2Matern <- Initialize(cs2Matern, spatDat)
corMatrix(cs2Matern)



