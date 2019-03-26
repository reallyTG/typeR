library(AER)


### Name: CameronTrivedi1998
### Title: Data and Examples from Cameron and Trivedi (1998)
### Aliases: CameronTrivedi1998
### Keywords: datasets

### ** Examples

library("MASS")
library("pscl")

###########################################
## Australian health service utilization ##
###########################################

## data
data("DoctorVisits", package = "AER")

## Poisson regression
dv_pois <- glm(visits ~ . + I(age^2), data = DoctorVisits, family = poisson)
dv_qpois <- glm(visits ~ . + I(age^2), data = DoctorVisits, family = quasipoisson)

## Table 3.3 
round(cbind(
  Coef = coef(dv_pois),
  MLH = sqrt(diag(vcov(dv_pois))),
  MLOP = sqrt(diag(vcovOPG(dv_pois))),
  NB1 = sqrt(diag(vcov(dv_qpois))),
  RS = sqrt(diag(sandwich(dv_pois)))
), digits = 3)

## Table 3.4
## NM2-ML
dv_nb <- glm.nb(visits ~ . + I(age^2), data = DoctorVisits)
summary(dv_nb)
## NB1-GLM = quasipoisson
summary(dv_qpois)

## overdispersion tests (page 79)
lrtest(dv_pois, dv_nb) ## p-value would need to be halved
dispersiontest(dv_pois, trafo = 1)
dispersiontest(dv_pois, trafo = 2)


##########################################
## Demand for medical care in NMES 1988 ##
##########################################

## select variables for analysis
data("NMES1988", package = "AER")
nmes <- NMES1988[,-(2:6)]

## dependent variable
## Table 6.1
table(cut(nmes$visits, c(0:13, 100)-0.5, labels = 0:13))

## NegBin regression
nmes_nb <- glm.nb(visits ~ ., data = nmes)

## NegBin hurdle
nmes_h <- hurdle(visits ~ ., data = nmes, dist = "negbin")

## from Table 6.3
lrtest(nmes_nb, nmes_h)

## from Table 6.4
AIC(nmes_nb)
AIC(nmes_nb, k = log(nrow(nmes)))
AIC(nmes_h)
AIC(nmes_h, k = log(nrow(nmes)))

## Table 6.8
coeftest(nmes_h, vcov = sandwich)
logLik(nmes_h)
1/nmes_h$theta


###################################################
## Recreational boating trips to Lake Somerville ##
###################################################

## data
data("RecreationDemand", package = "AER")

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
logLik(fm_nb)

## ZIP model:
## Cameron and Trivedi (1998), Table 6.11
fm_zip <- zeroinfl(trips ~  . | quality + income, data = RecreationDemand)
summary(fm_zip)
logLik(fm_zip)

## Hurdle models
## Cameron and Trivedi (1998), Table 6.13
## poisson-poisson
sval <- list(count = c(2.15, 0.044, .467, -.097, .601, .002, -.036, .024), 
             zero = c(-1.88, 0.815, .403, .01, 2.95, 0.006, -.052, .046))
fm_hp0 <- hurdle(trips ~ ., data = RecreationDemand, dist = "poisson",
  zero = "poisson", start = sval, maxit = 0)
fm_hp1 <- hurdle(trips ~ ., data = RecreationDemand, dist = "poisson",
  zero = "poisson", start = sval)
fm_hp2 <- hurdle(trips ~ ., data = RecreationDemand, dist = "poisson",
  zero = "poisson")
sapply(list(fm_hp0, fm_hp1, fm_hp2), logLik)

## negbin-negbin
fm_hnb <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin", zero = "negbin")
summary(fm_hnb)
logLik(fm_hnb)

sval <- list(count = c(0.841, 0.172, .622, -.057, .576, .057, -.078, .012), 
             zero = c(-3.046, 4.638, -.025, .026, 16.203, 0.030, -.156, .117),
             theta = c(count = 1/1.7, zero = 1/5.609))
fm_hnb2 <- hurdle(trips ~ ., data = RecreationDemand,
  dist = "negbin", zero = "negbin", start = sval)
summary(fm_hnb2)
logLik(fm_hnb2)


## geo-negbin
sval98 <- list(count = c(0.841, 0.172, .622, -.057, .576, .057, -.078, .012), 
             zero = c(-2.88, 1.44, .4, .03, 9.43, 0.01, -.08, .071),
             theta = c(count = 1/1.7))
sval96 <- list(count = c(0.841, 0.172, .622, -.057, .576, .057, -.078, .012), 
             zero = c(-2.882, 1.437, .406, .026, 11.936, 0.008, -.081, .071),
             theta = c(count = 1/1.7))
      
fm_hgnb <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin", zero = "geometric")
summary(fm_hgnb)
logLik(fm_hgnb)

## logLik with starting values from Gurmu + Trivedi 1996
fm_hgnb96 <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin", zero = "geometric",
                  start = sval96, maxit = 0)
logLik(fm_hgnb96)

## logit-negbin
fm_hgnb2 <- hurdle(trips ~ ., data = RecreationDemand, dist = "negbin")
summary(fm_hgnb2)
logLik(fm_hgnb2)

## Note: quasi-complete separation
with(RecreationDemand, table(trips > 0, userfee))



