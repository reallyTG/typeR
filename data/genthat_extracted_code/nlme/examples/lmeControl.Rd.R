library(nlme)


### Name: lmeControl
### Title: Specifying Control Values for lme Fit
### Aliases: lmeControl
### Keywords: models

### ** Examples

# decrease the maximum number iterations in the ms call and
# request that information on the evolution of the ms iterations be printed
str(lCtr <- lmeControl(msMaxIter = 20, msVerbose = TRUE))
## This should always work:
do.call(lmeControl, lCtr)



