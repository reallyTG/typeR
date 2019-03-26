library(SimComp)


### Name: SimCiDiff
### Title: Simultaneous Confidence Intervals for General Contrasts
###   (Differences) of Means of Multiple Endpoints
### Aliases: SimCiDiff SimCiDiff.default SimCiDiff.formula
### Keywords: htest

### ** Examples

# Example 1:
# Simultaneous confidence intervals related to a comparison of the groups
# B and H against the standard S, for endpoint Thromb.count, assuming unequal
# variances for the groups. This is an extension of the well-known Dunnett-
# intervals to the case of heteroscedasticity.

data(coagulation)

interv1 <- SimCiDiff(data=coagulation, grp="Group", resp="Thromb.count",
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
interv1
plot(interv1)

# Example 2:
# Simultaneous confidence intervals related to a comparisons of the groups
# B and H against the standard S, simultaneously for all endpoints, assuming
# unequal covariance matrices for the groups. This is an extension of the well-
# known Dunnett-intervals to the case of heteroscedasticity and multiple
# endpoints.

data(coagulation)

interv2 <- SimCiDiff(data=coagulation, grp="Group", resp=c("Thromb.count","ADP","TRAP"),
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
summary(interv2)
plot(interv2)



