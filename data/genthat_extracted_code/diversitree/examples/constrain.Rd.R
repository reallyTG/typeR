library(diversitree)


### Name: constrain
### Title: Constrain Parameters of a Model
### Aliases: constrain constrain.i
### Keywords: programming

### ** Examples

## Same example likelihood function as for find.mle - BiSSE on a
## tree with 203 species, generated with an asymmetry in the speciation
## rates.
pars <- c(0.1, 0.2, 0.03, 0.03, 0.01, 0.01)
set.seed(2)
phy <- tree.bisse(pars, max.t=60, x0=0)
lik <- make.bisse(phy, phy$tip.state)

argnames(lik) # Canonical argument names

## Specify equal speciation rates
lik.2 <- constrain(lik, lambda0 ~ lambda1)
argnames(lik.2) # Note lambda0 now missing

## On constrained functions, use the "pars.only" argument to see what
## the full argument list would be:
lik.2(c(.1, pars[3:6]), pars.only=TRUE)

## Check this works:
lik(c(.1, .1, pars[3:6])) == lik.2(c(.1, pars[3:6]))

## For optimisation of these functions, see find.mle, which
## includes an example.

## More complicated; constrain lambda0 to half of lambda1, constrain mu0
## to be the same mu1, and set q01 equal to zero.
lik.3 <- constrain(lik, lambda0 ~ lambda1 / 2, mu0 ~ mu1, q01 ~ 0)
argnames(lik.3) # lambda1, mu1, q10
lik(c(.1, .2, .03, .03, 0, .01)) == lik.3(c(.2, .03, .01))

## Alternatively, coefficients can be specified using a list of
## constraints:
cons <- list(lambda1 ~ lambda0, mu1 ~ mu0, q10 ~ q01)
constrain(lik, formulae=cons)

## Using the "extra" argument allows recasting things to dummy
## parameters.  Here both lambda0 and lambda1 are mapped to the
## parameter "lambda":
lik.4 <- constrain(lik, lambda0 ~ lambda, lambda1 ~ lambda, extra="lambda")
argnames(lik.4)

## constrain.i can be useful for setting a number of values at once.
## Suppose we wanted to look at the shape of the likelihood surface with
## respect to one parameter around the ML point.  For this tree, the ML
## point is approximately:
p.ml <- c(0.09934, 0.19606, 0.02382, 0.03208, 0.01005, 0.00982)

## Leaving just lambda1 (which is parameter number 2) free:
lik.l1 <- constrain.i(lik, p.ml, 2)

## The function now reports that five of the parameters are constrained,
## with one free (lambda1)
lik.l1

## Likewise:
argnames(lik.l1)

## Looking in the neighbourhood of the ML point, the likelihood surface
## is approximately quadratic:
pp <- seq(p.ml[2] - .02, p.ml[2] + .02, length.out=15)
yy <- sapply(pp, lik.l1)
plot(yy ~ pp, type="b", xlab="lambda 1", ylab="Log likelihood")
abline(v=p.ml[2], col="red", lty=2)

## pars.only works as above, returning the full parameter vector
lik.l1(p.ml[2], pars.only=TRUE)
identical(p.ml, lik.l1(p.ml[2], pars.only=TRUE))



