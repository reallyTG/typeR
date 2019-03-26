library(SAMUR)


### Name: samur
### Title: Stochastic Augmentation of Matched Datasets Using Restriction
###   Methods
### Aliases: samur print.samur

### ** Examples

## Not run: 
##D library(SAMUR)
##D library(Matching)
##D data(lalonde)
##D myformula <- treat ~ age + educ
##D myglm <- glm(myformula, lalonde, family="binomial")
##D X <- myglm$fitted.values
##D # using M=1 and replace=F to ensure no duplication
##D bimatch <- Match(Tr = lalonde$treat, X = myglm$fitted.values
##D   , M = 1, replace = F, caliper = 0.25)
##D idx <- c(bimatch$index.control, bimatch$index.treated)
##D my.samur <- samur(formula = myformula, data = lalonde
##D   , matched.subset = idx, nsmp = 100
##D   , breaks = 10, use.quantile = TRUE)
##D summary(my.samur, nboots = 500)
## End(Not run)



