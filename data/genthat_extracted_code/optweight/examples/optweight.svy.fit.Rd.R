library(optweight)


### Name: optweight.svy.fit
### Title: Fitting Function for Optweight for Survey Weights
### Aliases: optweight.svy.fit

### ** Examples

library("cobalt")
data("lalonde", package = "cobalt")

covs <- splitfactor(lalonde[c("age", "educ", "race",
                  "married", "nodegree")],
                  drop.first = FALSE)

targets <- c(23, 9, .3, .3, .4, .2, .5)

tols <- rep(0, 7)

ows.fit <- optweight.svy.fit(covs,
                             tols = tols,
                             targets = targets,
                             norm = "l2")

#Unweighted means
apply(covs, 2, mean)

#Weighted means; same as targets
apply(covs, 2, weighted.mean, w = ows.fit$w)



