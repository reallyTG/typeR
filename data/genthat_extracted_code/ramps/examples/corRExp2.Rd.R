library(ramps)


### Name: corRExp2
### Title: Non-Separable Exponential Spatio-Temporal Correlation Structure
### Aliases: corRExp2
### Keywords: models

### ** Examples

sp1 <- corRExp2(form = ~ x + y + t)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4, t=(0:4)/4)

cs1Exp <- corRExp2(c(1, 1, 1), form = ~ x + y + t)
cs1Exp <- Initialize(cs1Exp, spatDat)
corMatrix(cs1Exp)

cs2Exp <- corRExp2(c(1, 1, 1), form = ~ x + y + t, metric = "man")
cs2Exp <- Initialize(cs2Exp, spatDat)
corMatrix(cs2Exp)



