library(psychotools)


### Name: anchortest
### Title: Anchor methods for the detection of uniform DIF in the Rasch
###   model
### Aliases: anchortest anchortest.default anchortest.formula
###   print.anchortest print.summary.anchortest summary.anchortest
### Keywords: regression

### ** Examples

if(requireNamespace("multcomp")) {

o <- options(digits = 4)

## Verbal aggression data
data("VerbalAggression", package = "psychotools")

## Rasch model for the self-to-blame situations; gender DIF test
raschmodels <- with(VerbalAggression, lapply(levels(gender), function(i) 
  raschmodel(resp2[gender == i, 1:12])))

## four anchor items from constant anchor class using MPT-selection
const1 <- anchortest(object = raschmodels[[1]], object2 = raschmodels[[2]],
  class = "constant", select = "MPT", length = 4)
const1
summary(const1)

## iterative forward anchor class using MTT-selection
set.seed(1)
forw1 <- anchortest(object = raschmodels[[1]], object2 = raschmodels[[2]], 
  class = "forward", select = "MTT", test = TRUE,
  adjust = "none", range = c(0.05,1))
forw1

## the same using the formula interface
set.seed(1)
forw2 <- anchortest(resp2[, 1:12] ~ gender, data = VerbalAggression,
  class = "forward", select = "MTT", test = TRUE,
  adjust = "none", range = c(0.05, 1))

## compare both results
all.equal(forw1, forw2, check.attributes = FALSE)

## DIF test with fixed given anchor (arbitrarily selected to be items 1 and 2)
anchortest(object = raschmodels[[1]], object2 = raschmodels[[2]], select = 1:2)

options(digits = o$digits)
}



