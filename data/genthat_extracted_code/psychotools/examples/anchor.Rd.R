library(psychotools)


### Name: anchor
### Title: Anchor Methods for the Detection of Uniform DIF the Rasch Model
### Aliases: anchor anchor.default anchor.formula print.anchor
###   print.summary.anchor summary.anchor
### Keywords: regression

### ** Examples

if(requireNamespace("multcomp")) {

## Verbal aggression data
data("VerbalAggression", package = "psychotools")

## Rasch model for the self-to-blame situations; gender DIF test
raschmodels <- with(VerbalAggression, lapply(levels(gender), function(i) 
  raschmodel(resp2[gender == i, 1:12])))

## four anchor items from constant anchor class using MPT-selection
canchor <- anchor(object = raschmodels[[1]], object2 = raschmodels[[2]], 
  class = "constant", select = "MPT", length = 4)
canchor
summary(canchor)

## iterative forward anchor class using MTT-selection
set.seed(1)
fanchor <- anchor(object = raschmodels[[1]], object2 = raschmodels[[2]],
  class = "forward", select = "MTT", range = c(0.05, 1))
fanchor

## the same using the formula interface
set.seed(1)
fanchor2 <- anchor(resp2[, 1:12] ~ gender , data = VerbalAggression,
  class = "forward", select = "MTT", range = c(0.05, 1))

## really the same?
all.equal(fanchor, fanchor2, check.attributes = FALSE)
}



