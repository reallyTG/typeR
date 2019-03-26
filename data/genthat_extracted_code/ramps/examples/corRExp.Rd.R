library(ramps)


### Name: corRExp
### Title: Exponential Spatial Correlation Structure
### Aliases: corRExp
### Keywords: models

### ** Examples

sp1 <- corRExp(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Exp <- corRExp(1, form = ~ x + y)
cs1Exp <- Initialize(cs1Exp, spatDat)
corMatrix(cs1Exp)

cs2Exp <- corRExp(1, form = ~ x + y, metric = "man")
cs2Exp <- Initialize(cs2Exp, spatDat)
corMatrix(cs2Exp)



