library(secr)


### Name: subset.capthist
### Title: Subset or Split capthist Object
### Aliases: subset.capthist split.capthist
### Keywords: manip

### ** Examples

tempcapt <- sim.capthist (make.grid(nx=6, ny=6), nocc=6)
summary(subset(tempcapt, occ=c(1,3,5)))

## Consider `proximity' detections at a random subset of detectors
## This would not make sense for `multi' detectors, as the 
## excluded detectors influence detection probabilities in 
## sim.capthist.

tempcapt2 <- sim.capthist (make.grid(nx = 6, ny = 6, 
    detector = "proximity"), nocc = 6)
tempcapt3 <- subset(tempcapt2, traps = sample(1:36, 18, 
    replace=FALSE))
summary(tempcapt3)
plot(tempcapt3)

split (tempcapt2, f = sample (c("A","B"), nrow(tempcapt2), 
    replace = TRUE))

## split out captures on alternate rows of a grid
split(captdata, f = rep(1:2, 50), bytrap = TRUE)

## Applying a covariate criterion across all sessions of a
## multi-session capthist object e.g. selecting male ovenbirds from the
## 2005--2009 ovenCH dataset. We include a resriction on occasions
## to demonstrate the use of 'MoreArgs'. Note that mapply() creates a
## list, and the class of the output must be restored manually.

ovenCH.males <- mapply(subset, ovenCH,
    subset = lapply(ovenCH, function(x) covariates(x)$Sex == "M"),
    MoreArgs = list(occasions = 1:5))
class(ovenCH.males) <- class(ovenCH)
summary(ovenCH.males, terse = TRUE)

## A simpler approach using the new function option in 3.1.1
subsetfn <- function(x, sex) covariates(x)$Sex == sex
ovenCH.males <- subset(ovenCH, subset = subsetfn, sex = "M")
summary(ovenCH.males, terse = TRUE)

## Divide one session into two by occasion
split(captdata, f = factor(c(1,1,2,2,2)), byoccasion = TRUE)




