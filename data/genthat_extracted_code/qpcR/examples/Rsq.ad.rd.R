library(qpcR)


### Name: Rsq.ad
### Title: Adjusted R-square value of a fitted model
### Aliases: Rsq.ad
### Keywords: models nonlinear

### ** Examples

## Single model.
m1 <- pcrfit(reps, 1, 2, l7)
Rsq.ad(m1)

## Compare different models with increasing
## number of parameters.
ml1 <- lapply(list(l4, l5, l6), function(x) pcrfit(reps, 1, 2, x))
sapply(ml1, function(x) Rsq.ad(x)) 



