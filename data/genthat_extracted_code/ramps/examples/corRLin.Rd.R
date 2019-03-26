library(ramps)


### Name: corRLin
### Title: Linear Spatial Correlation Structure
### Aliases: corRLin
### Keywords: models

### ** Examples

sp1 <- corRLin(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Lin <- corRLin(1, form = ~ x + y)
cs1Lin <- Initialize(cs1Lin, spatDat)
corMatrix(cs1Lin)

cs2Lin <- corRLin(1, form = ~ x + y, metric = "man")
cs2Lin <- Initialize(cs2Lin, spatDat)
corMatrix(cs2Lin)



