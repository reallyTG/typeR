library(ramps)


### Name: corRExpwr
### Title: Powered Exponential Spatial Correlation Structure
### Aliases: corRExpwr
### Keywords: models

### ** Examples

sp1 <- corRExpwr(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Expwr <- corRExpwr(c(1, 1), form = ~ x + y)
cs1Expwr <- Initialize(cs1Expwr, spatDat)
corMatrix(cs1Expwr)

cs2Expwr <- corRExpwr(c(1, 1), form = ~ x + y, metric = "man")
cs2Expwr <- Initialize(cs2Expwr, spatDat)
corMatrix(cs2Expwr)



