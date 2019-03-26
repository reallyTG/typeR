library(BioMark)


### Name: biom.options
### Title: Set or return options for stability-based biomarker selection
### Aliases: biom.options
### Keywords: classification multivariate

### ** Examples

## Return current options:
biom.options()
biom.options("max.seg")

## Set options:
biom.options(max.seg = 100, oob.fraction = .2)
biom.options(lasso = list(alpha = .75, nlambda = 50))
biom.options()
## the next line removes some options - for these, glmnet defaults will be used
biom.options(lasso = list(alpha = .9, family = "binomial"))

## Restore factory settings:
biom.options(reset = TRUE)



