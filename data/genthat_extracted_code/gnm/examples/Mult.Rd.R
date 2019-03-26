library(gnm)


### Name: Multiplicative interaction
### Title: Specify a Product of Predictors in a gnm Model Formula
### Aliases: Mult
### Keywords: models regression nonlinear

### ** Examples

set.seed(1)

## Using 'Mult' with 'Exp' to constrain the first constituent multiplier
##  to be non-negative

## Fit the "UNIDIFF" mobility model across education levels
unidiff <- gnm(Freq ~ educ*orig + educ*dest +
               Mult(Exp(educ), orig:dest),
               family = poisson, data = yaish, subset = (dest != 7))

## Not run: 
##D ## (this example can take quite a while to run)
##D ##
##D ## Fitting two instances of a multiplicative interaction (i.e. a
##D ## two-component interaction))
##D yield.scaled <- wheat$yield * sqrt(3/1000)
##D treatment <- factor(paste(wheat$tillage, wheat$summerCrop, wheat$manure,
##D                           wheat$N, sep = ""))
##D bilinear2 <- gnm(yield.scaled ~ year + treatment +
##D                  instances(Mult(year, treatment), 2),
##D                  family = gaussian, data = wheat)
##D formula(bilinear2)
##D ## yield.scaled ~ year + treatment + Mult(year, treatment, inst = 1) + 
##D ##     Mult(year, treatment, inst = 2)
## End(Not run)



