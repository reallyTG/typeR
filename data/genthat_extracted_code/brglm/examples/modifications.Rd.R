library(brglm)


### Name: modifications
### Title: Additive Modifications to the Binomial Responses and Totals for
###   Use within 'brglm.fit'
### Aliases: modifications checkModifications
### Keywords: models regression

### ** Examples

## Begin Example 1
## logistic exposure model, following the Example in ?family. See,
## Shaffer, T.  2004. Auk 121(2): 526-540.
# Definition of the link function
logexp <- function(days = 1) {
  linkfun <- function(mu) qlogis(mu^(1/days))
  linkinv <- function(eta) plogis(eta)^days
  mu.eta <- function(eta) days * plogis(eta)^(days-1) *
        binomial()$mu.eta(eta)
  valideta <- function(eta) TRUE
  link <- paste("logexp(", days, ")", sep="")
  structure(list(linkfun = linkfun, linkinv = linkinv,
    mu.eta = mu.eta, valideta = valideta, name = link),
    class = "link-glm")
}
# Here d(p) = days * p * ( 1 - p^(1/days) )
#      d'(p) = (days - (days+1) * p^(1/days)) * d(p)
#      w(p) = days^2 * p * (1-p^(1/days))^2 / (1-p)
# Initial modifications, as given from the general expressions above:
br.custom.family <- function(p) {
  etas <- binomial(logexp(.days))$linkfun(p)
  # the link function argument `.days' will be detected by lexical
  # scoping. So, make sure that the link-function inputted arguments
  # have unusual names, like `.days' and that
  # the link function enters `brglm' as
  # `family=binomial(logexp(.days))'.
  list(ar = 0.5*(1-p)-0.5*(1-p)*exp(etas)/.days,
       at = 0*p/p) # so that to fix the length of at
}
.days <-3
# `.days' could be a vector as well but then it should have the same
# length as the number of observations (`length(.days)' should be
# equal to `length(p)'). In this case, `checkModifications' should
# have argument `Length=length(.days)'.
#
# Check:
## Not run: checkModifications(br.custom.family)
# OOOPS error message... the condition is not satisfied
#
# After some trivial algebra using the two allowed operations, we
# get new modifications:
br.custom.family <- function(p) {
  etas <- binomial(logexp(.days))$linkfun(p)
  list(ar=0.5*p/p, # so that to fix the length of ar
       at=0.5+exp(etas)*(1-p)/(2*p*.days))
}
# Check:
checkModifications(br.custom.family)
# It is OK.
# Now,
modifications(binomial(logexp(.days)))
# works.
# Notice that for `.days <- 1', `logexp(.days)' is the `logit' link
# model and `a_r=0.5', `a_t=1'.
# In action:
library(MASS)
example(birthwt)
m.glm <- glm(formula = low ~ ., family = binomial, data = bwt)
.days <- bwt$age
m.glm.logexp <- update(m.glm,family=binomial(logexp(.days)))
m.brglm.logexp <- brglm(formula = low ~ ., family =
binomial(logexp(.days)), data = bwt)
# The fit for the `logexp' link via maximum likelihood
m.glm.logexp
# and the fit for the `logexp' link via modified scores
m.brglm.logexp
## End Example
## Begin Example 2
## Another possible use of brglm.fit:
## Deviating from bias reducing modified-scores:
## Add 1/2 to the response of a probit model.
y <- c(1,2,3,4)
totals <- c(5,5,5,5)
x1 <- c(1,0,1,0)
x2 <- c(1,1,0,0)
my.probit <- make.link("probit")
my.probit$name <- "my.probit"
br.custom.family <- function(p) {
   h <- pmax(get("hats",parent.frame()),.Machine$double.eps)
   list(ar=0.5/h,at=1/h)
}
m1 <- brglm(y/totals~x1+x2,weights=totals,family=binomial(my.probit))
m2 <- glm((y+0.5)/(totals+1)~x1+x2,weights=totals+1,family=binomial(probit))
# m1 and m2 should be the same.



