library(spind)


### Name: aic.calc
### Title: Akaike Information Criterion with correction for sample size
### Aliases: aic.calc

### ** Examples

data(musdata)
coords <- musdata[ ,4:5]
mglm <- glm(musculus ~ pollution + exposure, "poisson", musdata)

aic <- aic.calc(musculus ~ pollution + exposure, "poisson", musdata,
                mglm$fitted)
aic$AIC




