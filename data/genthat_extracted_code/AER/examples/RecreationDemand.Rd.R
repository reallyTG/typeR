library(AER)


### Name: RecreationDemand
### Title: Recreation Demand Data
### Aliases: RecreationDemand
### Keywords: datasets

### ** Examples

data("RecreationDemand")

## Poisson model:
## Cameron and Trivedi (1998), Table 6.11
## Ozuna and Gomez (1995), Table 2, col. 3
fm_pois <- glm(trips ~ ., data = RecreationDemand, family = poisson)
summary(fm_pois)
logLik(fm_pois)
coeftest(fm_pois, vcov = sandwich)

## Negbin model:
## Cameron and Trivedi (1998), Table 6.11
## Ozuna and Gomez (1995), Table 2, col. 5
library("MASS")
fm_nb <- glm.nb(trips ~ ., data = RecreationDemand)
coeftest(fm_nb, vcov = vcovOPG)

## ZIP model:
## Cameron and Trivedi (1998), Table 6.11
library("pscl")
fm_zip <- zeroinfl(trips ~  . | quality + income, data = RecreationDemand)
summary(fm_zip)

## Hurdle models
## Cameron and Trivedi (1998), Table 6.13
## poisson-poisson
fm_hp <- hurdle(trips ~ ., data = RecreationDemand, dist = "poisson", zero = "poisson")
## negbin-negbin
fm_hnb <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin", zero = "negbin")
## binom-negbin == geo-negbin
fm_hgnb <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin")

## Note: quasi-complete separation
with(RecreationDemand, table(trips > 0, userfee))



