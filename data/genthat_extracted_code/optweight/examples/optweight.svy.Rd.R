library(optweight)


### Name: optweight.svy
### Title: Estimate Targeting Weights Using Optimization
### Aliases: optweight.svy print.optweight.svy

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

cov.formula <- ~ age + educ + race + married +
                      nodegree

targets <- check.targets(cov.formula, data = lalonde,
                        targets = c(23, 9, .3, .3, .4,
                                    .2, .5))

tols <- check.tols(cov.formula, data = lalonde,
                   tols = 0)

ows <- optweight.svy(cov.formula,
                     data = lalonde,
                     tols = tols,
                     targets = targets)
ows

covs <- splitfactor(lalonde[c("age", "educ", "race",
                  "married", "nodegree")],
                  drop.first = FALSE)
#Unweighted means
apply(covs, 2, mean)

#Weighted means; same as targets
apply(covs, 2, weighted.mean, w = ows$weights)



