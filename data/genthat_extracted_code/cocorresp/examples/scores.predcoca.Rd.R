library(cocorresp)


### Name: scores.predcoca
### Title: Get Species or Site Scores from an Ordination
### Aliases: scores.predcoca scores.symcoca
### Keywords: multivariate methods

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## load some data
data(beetles)
data(plants)

## log transform the bettle data
beetles <- log(beetles + 1)

## fit the model, a symmetric CoCA
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")

## extract the scores
scr <- scores(bp.sym)

## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)
scr2 <- scores(bp.pred)

## Don't show: 
options(od)
## End(Don't show)



