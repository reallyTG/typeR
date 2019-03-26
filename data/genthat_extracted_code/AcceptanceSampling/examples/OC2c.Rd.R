library(AcceptanceSampling)


### Name: OC2c
### Title: Operating Characteristics of an Acceptance Sampling Plan
### Aliases: OC2c plot,OC2c-method plot,OCbinomial,missing-method
###   plot,numeric,OCbinomial-method plot,OChypergeom,missing-method
###   plot,numeric,OChypergeom-method plot,OCpoisson,missing-method
###   plot,numeric,OCpoisson-method show,OC2c-method
###   show,OChypergeom-method summary,OC2c-method
###   summary,OChypergeom-method
### Keywords: classes

### ** Examples

## A standard binomial sampling plan
x <- OC2c(10,1)
x ## print out a brief summary
plot(x) ## plot the OC curve
plot(x, xlim=c(0,0.5)) ## plot the useful part of the OC curve

## A double sampling plan
x <- OC2c(c(125,125), c(1,4), c(4,5), pd=seq(0,0.1,0.001))
x
plot(x) ## Plot the plan

## Assess whether the plan can meet desired risk points
assess(x, PRP=c(0.01, 0.95), CRP=c(0.05, 0.04))

## A plan based on the Hypergeometric distribution
x <- OC2c(10,1, type="hypergeom", N=5000, pd=seq(0,0.5, 0.025))
plot(x)

## The summary
x <- OC2c(10,1, type="hypergeom", N=5000, pd=seq(0,0.5, 0.1))
summary(x, full=TRUE)

## Plotting against a function which generates P(defective)
xm <- seq(-3, 3, 0.05) ## The mean of the underlying characteristic
x <- OC2c(10, 1, pd=1-pnorm(0, mean=xm, sd=1))
plot(xm, x) ## Plot P(accept) against mean



