library(drc)


### Name: CIcompX
### Title: Calculation of combination index for binary mixtures
### Aliases: CIcompX CIcomp plotFACI
### Keywords: models nonlinear

### ** Examples

## Fitting marginal models for the 2 pure substances
acidiq.0 <- drm(rgr ~ dose, data = subset(acidiq, pct == 999 | pct == 0), fct = LL.4())
acidiq.100 <- drm(rgr ~ dose, data = subset(acidiq, pct == 999 | pct == 100), fct = LL.4())

## Fitting model for single mixture with ratio 17:83
acidiq.17 <- drm(rgr ~ dose, data = subset(acidiq, pct == 17 | pct == 0), fct = LL.4())
    
## Calculation of combination indices based on ED10, ED20, ED50
CIcomp(0.17, list(acidiq.17, acidiq.0, acidiq.100), c(10, 20, 50))  
## CI>1 significantly for ED10 and ED20, but not so for ED50




