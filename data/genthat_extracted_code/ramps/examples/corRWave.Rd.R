library(ramps)


### Name: corRWave
### Title: Sine Wave Spatial Correlation Structure
### Aliases: corRWave
### Keywords: models

### ** Examples

sp1 <- corRWave(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Wave <- corRWave(1, form = ~ x + y)
cs1Wave <- Initialize(cs1Wave, spatDat)
corMatrix(cs1Wave)

cs2Wave <- corRWave(1, form = ~ x + y, metric = "man")
cs2Wave <- Initialize(cs2Wave, spatDat)
corMatrix(cs2Wave)



