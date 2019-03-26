library(robmixglm)


### Name: extractAIC
### Title: Extract AIC from a Fitted Model
### Aliases: extractAIC.robmixglm
### Keywords: models

### ** Examples
## No test: 
library(MASS)
data(forbes)
forbes.robustmix <- robmixglm(bp~pres,data=MASS::forbes)
extractAIC(forbes.robustmix)
## End(No test)


