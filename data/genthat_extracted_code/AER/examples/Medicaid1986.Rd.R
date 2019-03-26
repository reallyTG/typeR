library(AER)


### Name: Medicaid1986
### Title: Medicaid Utilization Data
### Aliases: Medicaid1986
### Keywords: datasets

### ** Examples

## data and packages
data("Medicaid1986")
library("MASS")
library("pscl")

## scale regressors
Medicaid1986$age2 <- Medicaid1986$age^2 / 100
Medicaid1986$school <- Medicaid1986$school / 10
Medicaid1986$income <- Medicaid1986$income / 10

## subsets
afdc <- subset(Medicaid1986, program == "afdc")[, c(1, 3:4, 15, 5:9, 11:13)]
ssi <- subset(Medicaid1986, program == "ssi")[, c(1, 3:4, 15, 5:13)]

## Gurmu (1997):
## Table VI., Poisson and negbin models
afdc_pois <- glm(visits ~ ., data = afdc, family = poisson)
summary(afdc_pois)
coeftest(afdc_pois, vcov = sandwich)

afdc_nb <- glm.nb(visits ~ ., data = afdc)
ssi_pois <- glm(visits ~ ., data = ssi, family = poisson)
ssi_nb <- glm.nb(visits ~ ., data = ssi)

## Table VII., Hurdle models (without semi-parametric effects)
afdc_hurdle <- hurdle(visits ~ . | . - access, data = afdc, dist = "negbin")
ssi_hurdle <- hurdle(visits ~ . | . - access, data = ssi, dist = "negbin")

## Table VIII., Observed and expected frequencies
round(cbind(
  Observed = table(afdc$visits)[1:8],
  Poisson = sapply(0:7, function(x) sum(dpois(x, fitted(afdc_pois)))),
  Negbin = sapply(0:7, function(x) sum(dnbinom(x, mu = fitted(afdc_nb), size = afdc_nb$theta))),
  Hurdle = colSums(predict(afdc_hurdle, type = "prob")[,1:8])
  )/nrow(afdc), digits = 3) * 100
round(cbind(
  Observed = table(ssi$visits)[1:8],
  Poisson = sapply(0:7, function(x) sum(dpois(x, fitted(ssi_pois)))),
  Negbin = sapply(0:7, function(x) sum(dnbinom(x, mu = fitted(ssi_nb), size = ssi_nb$theta))),
  Hurdle = colSums(predict(ssi_hurdle, type = "prob")[,1:8])
  )/nrow(ssi), digits = 3) * 100



