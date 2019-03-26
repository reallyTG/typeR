library(AER)


### Name: dispersiontest
### Title: Dispersion Test
### Aliases: dispersiontest
### Keywords: htest

### ** Examples

data("RecreationDemand")
rd <- glm(trips ~ ., data = RecreationDemand, family = poisson)

## linear specification (in terms of dispersion)
dispersiontest(rd)
## linear specification (in terms of alpha)
dispersiontest(rd, trafo = 1)
## quadratic specification (in terms of alpha)
dispersiontest(rd, trafo = 2)
dispersiontest(rd, trafo = function(x) x^2)

## further examples
data("DoctorVisits")
dv <- glm(visits ~ . + I(age^2), data = DoctorVisits, family = poisson)
dispersiontest(dv)

data("NMES1988")
nmes <- glm(visits ~ health + age + gender + married + income + insurance,
  data = NMES1988, family = poisson)
dispersiontest(nmes)



