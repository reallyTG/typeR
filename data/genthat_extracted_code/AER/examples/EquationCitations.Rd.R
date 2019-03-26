library(AER)


### Name: EquationCitations
### Title: Number of Equations and Citations for Evolutionary Biology
###   Publications
### Aliases: EquationCitations
### Keywords: datasets

### ** Examples

## load data and MASS package
data("EquationCitations", package = "AER")
library("MASS")

## convenience function for summarizing NB models
nbtable <- function(obj, digits = 3) round(cbind(
  "OR" = exp(coef(obj)),
  "CI" = exp(confint.default(obj)),
  "Wald z" = coeftest(obj)[,3],
  "p" = coeftest(obj)[, 4]), digits = digits)


#################
## Replication ##
#################

## Table 1
m1a <- glm.nb(othercites ~ I(equations/pages) * pages + journal,
  data = EquationCitations)
m1b <- update(m1a, nontheocites ~ .)
m1c <- update(m1a, theocites ~ .)
nbtable(m1a)
nbtable(m1b)
nbtable(m1c)

## Table 2
m2a <- glm.nb(
  othercites ~ (I(mainequations/pages) + I(appequations/pages)) * pages + journal,
  data = EquationCitations)
m2b <- update(m2a, nontheocites ~ .)
m2c <- update(m2a, theocites ~ .)
nbtable(m2a)
nbtable(m2b)
nbtable(m2c)


###############
## Extension ##
###############

## nonlinear page effect: use log(pages) instead of pages+interaction
m3a <- glm.nb(othercites ~ I(equations/pages) + log(pages) + journal,
  data = EquationCitations)
m3b <- update(m3a, nontheocites ~ .)
m3c <- update(m3a, theocites ~ .)

## nested models: allow different equation effects over journals
m4a <- glm.nb(othercites ~ journal / I(equations/pages) + log(pages),
  data = EquationCitations)
m4b <- update(m4a, nontheocites ~ .)
m4c <- update(m4a, theocites ~ .)

## nested model best (wrt AIC) for all responses
AIC(m1a, m2a, m3a, m4a)
nbtable(m4a)
AIC(m1b, m2b, m3b, m4b)
nbtable(m4b)
AIC(m1c, m2c, m3c, m4c)
nbtable(m4c)
## equation effect by journal/response
##           comb nontheo theo
## AmNat     =/-  -       +
## Evolution =/+  =       +
## ProcB     -    -       =/+



