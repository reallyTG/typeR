library(nlme)


### Name: Variogram.default
### Title: Calculate Semi-variogram
### Aliases: Variogram.default
### Keywords: models

### ** Examples

## Not run: 
##D fm1 <- lm(follicles ~ sin(2 * pi * Time) + cos(2 * pi * Time), Ovary,
##D           subset = Mare == 1)
##D Variogram(resid(fm1), dist(1:29))[1:10,]
## End(Not run)



