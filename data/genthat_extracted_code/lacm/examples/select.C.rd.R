library(lacm)


### Name: select.C
### Title: Identification of the 'C' Constant for Maximum Pairwise
###   Likelihood Estimation
### Aliases: select.C
### Keywords: regression nonlinear timeseries

### ** Examples

## a small example with simulated data
data(sim50, package = "lacm")
## fit model with pairwise likelihood of order 1
mod1 <- lacm(y ~ x, data = sim50)
summary(mod1)
## selection of C: suggests C = 2
select.C(mod1)
## summary with C = 2
summary(mod1, C = 2)

## a more 'interesting' example with the Polio data
## No test: 
data("polio", package = "lacm")
## model components
trend <- 1:length(polio)
sin.term <- sin(2 * pi * trend / 12)
cos.term <- cos(2 * pi * trend / 12)
sin2.term <- sin(2 * pi * trend / 6)
cos2.term <- cos(2 * pi * trend / 6)
## fit model with pairwise likelihood of order 1
mod1 <- lacm(polio ~ I(trend * 10^(-3)) + sin.term + cos.term + sin2.term + cos2.term)
mod1
## selection of C: suggests C between 1 and 3
select.C(mod1)
## End(No test)



