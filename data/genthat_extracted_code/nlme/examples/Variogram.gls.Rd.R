library(nlme)


### Name: Variogram.gls
### Title: Calculate Semi-variogram for Residuals from a gls Object
### Aliases: Variogram.gls
### Keywords: models

### ** Examples

## Not run: 
##D fm1 <- gls(weight ~ Time * Diet, BodyWeight)
##D Variogram(fm1, form = ~ Time | Rat)[1:10,]
## End(Not run)



