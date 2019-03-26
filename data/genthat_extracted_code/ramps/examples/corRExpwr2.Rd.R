library(ramps)


### Name: corRExpwr2
### Title: Non-Separable Powered Exponential Spatio-Temporal Correlation
###   Structure
### Aliases: corRExpwr2
### Keywords: models

### ** Examples

sp1 <- corRExpwr2(form = ~ x + y + t)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4, t=(0:4)/4)

cs1Expwr <- corRExpwr2(c(1, 1, 1, 1, 1), form = ~ x + y + t)
cs1Expwr <- Initialize(cs1Expwr, spatDat)
corMatrix(cs1Expwr)

cs2Expwr <- corRExpwr2(c(1, 1, 1, 1, 1), form = ~ x + y + t, metric = "man")
cs2Expwr <- Initialize(cs2Expwr, spatDat)
corMatrix(cs2Expwr)



