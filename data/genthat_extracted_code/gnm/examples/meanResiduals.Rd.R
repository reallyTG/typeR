library(gnm)


### Name: meanResiduals
### Title: Average Residuals within Factor Levels
### Aliases: meanResiduals
### Keywords: models regression nonlinear

### ** Examples

## Fit a conditional independence model, leaving out
## the uninformative subtable for dest == 7:
CImodel <- gnm(Freq ~ educ*orig + educ*dest, family = poisson,
               data = yaish, subset = (dest != 7))

## compute mean residuals over origin and destination
meanRes <- meanResiduals(CImodel, ~ orig:dest)
meanRes
summary(meanRes)

## Not run: 
##D ## requires vcdExtra package
##D ## display mean residuals for origin and destination
##D library(vcdExtra)
##D mosaic(CImodel, ~orig+dest)
## End(Not run)

## non-aggregated residuals
res1 <- meanResiduals(CImodel, ~ educ:orig:dest)
res2 <- residuals(CImodel, type = "pearson")
all.equal(as.numeric(res1), as.numeric(res2))



