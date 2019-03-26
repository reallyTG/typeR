library(cocorresp)


### Name: coca
### Title: Fit Co-Correspondence Analysis Ordination Models
### Aliases: coca coca.formula coca.default print.predcoca print.symcoca
### Keywords: multivariate regression models

### ** Examples

## Don't show: 
od <- options(digits = 4)
## End(Don't show)
## symmetric CoCA
data(beetles)
## log transform the bettle data
beetles <- log(beetles + 1)
data(plants)
## fit the model
bp.sym <- coca(beetles ~ ., data = plants, method = "symmetric")
bp.sym
## No test: 
summary(bp.sym)
## End(No test)
plot(bp.sym)

## predictive CoCA using SIMPLS and formula interface
bp.pred <- coca(beetles ~ ., data = plants)
## should retain only the useful PLS components for a parsimonious model

## Leave-one-out crossvalidation - this takes a while

## Not run: 
##D crossval(beetles, plants)
##D ## so 2 axes are sufficient
##D ## permutation test to assess significant PLS components - takes a while
##D bp.perm <- permutest(bp.pred, permutations = 99)
##D bp.perm
## End(Not run)

## agrees with the Leave-one-out cross-validation
## refit the model with only 2 PLS components
bp.pred <- coca(beetles ~ ., data = plants, n.axes = 2)
bp.pred
## No test: 
summary(bp.pred)
## End(No test)
plot(bp.pred)

## predictive CoCA using Eigen-analysis
data(bryophyte)
data(vascular)
carp.pred <- coca(y = bryophyte, x = vascular, reg.method = "eigen")
carp.pred

## determine important PLS components - takes a while
## Not run: 
##D crossval(bryophyte, vascular)
##D (carp.perm <- permutest(carp.pred, permutations = 99))
## End(Not run)

## 2 components again, refit
carp.pred <- coca(y = bryophyte, x = vascular,
                  reg.method = "eigen", n.axes = 2)
carp.pred
## plot
plot(carp.pred)
## Don't show: 
options(od)
## End(Don't show)



