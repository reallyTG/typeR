library(lacm)


### Name: CLIC
### Title: Composite Likelihood Information Criterion
### Aliases: CLIC
### Keywords: regression nonlinear timeseries

### ** Examples

## a small example with simulated data
data(sim50, package = "lacm")
mod <- lacm(y ~ x, data = sim50)
summary(mod)
CLIC(mod)
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
CLIC(mod1)
## End(No test)



