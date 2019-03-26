library(ramps)


### Name: corRCauchy
### Title: Cauchy Spatial Correlation Structure
### Aliases: corRCauchy
### Keywords: models

### ** Examples

sp1 <- corRCauchy(form = ~ x + y + z)

spatDat <- data.frame(x = (0:4)/4, y = (0:4)/4)

cs1Cauchy <- corRCauchy(1, form = ~ x + y)
cs1Cauchy <- Initialize(cs1Cauchy, spatDat)
corMatrix(cs1Cauchy)

cs2Cauchy <- corRCauchy(1, form = ~ x + y, metric = "man")
cs2Cauchy <- Initialize(cs2Cauchy, spatDat)
corMatrix(cs2Cauchy)



