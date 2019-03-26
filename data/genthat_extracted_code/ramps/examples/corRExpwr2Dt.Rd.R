library(ramps)


### Name: corRExpwr2Dt
### Title: Non-Separable Temporally Integrated Powered Exponential Spatial
###   Correlation Structure
### Aliases: corRExpwr2Dt
### Keywords: models

### ** Examples

sp1 <- corRExpwr2Dt(form = ~ x + y + t1 + t2)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4, t1=(0:4)/4, t2=(1:5)/4)

cs1ExpwrDt <- corRExpwr2Dt(c(1, 1, 1, 1), form = ~ x + y + t1 + t2)
cs1ExpwrDt <- Initialize(cs1ExpwrDt, spatDat)
corMatrix(cs1ExpwrDt)

cs2ExpwrDt <- corRExpwr2Dt(c(1, 1, 1, 1), form = ~ x + y + t1 + t2, metric = "man")
cs2ExpwrDt <- Initialize(cs2ExpwrDt, spatDat)
corMatrix(cs2ExpwrDt)



