library(mgcv)


### Name: extract.lme.cov
### Title: Extract the data covariance matrix from an lme object
### Aliases: extract.lme.cov extract.lme.cov2
### Keywords: models smooth regression

### ** Examples

## see also ?formXtViX for use of extract.lme.cov2
require(mgcv)
library(nlme)
data(Rail)
b <- lme(travel~1,Rail,~1|Rail)
extract.lme.cov(b)
extract.lme.cov2(b)



