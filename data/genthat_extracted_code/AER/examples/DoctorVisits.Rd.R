library(AER)


### Name: DoctorVisits
### Title: Australian Health Service Utilization Data
### Aliases: DoctorVisits
### Keywords: datasets

### ** Examples

data("DoctorVisits", package = "AER")
library("MASS")

## Cameron and Trivedi (1986), Table III, col. (1)
dv_lm <- lm(visits ~ . + I(age^2), data = DoctorVisits)
summary(dv_lm)

## Cameron and Trivedi (1998), Table 3.3 
dv_pois <- glm(visits ~ . + I(age^2), data = DoctorVisits, family = poisson)
summary(dv_pois)                  ## MLH standard errors
coeftest(dv_pois, vcov = vcovOPG) ## MLOP standard errors
logLik(dv_pois)
## standard errors denoted RS ("unspecified omega robust sandwich estimate")
coeftest(dv_pois, vcov = sandwich)

## Cameron and Trivedi (1986), Table III, col. (4)
dv_nb <- glm.nb(visits ~ . + I(age^2), data = DoctorVisits)
summary(dv_nb)
logLik(dv_nb)



