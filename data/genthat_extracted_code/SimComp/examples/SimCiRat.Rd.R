library(SimComp)


### Name: SimCiRat
### Title: Simultaneous Confidence Intervals for General Contrasts (Ratios)
###   of Means of Multiple Endpoints
### Aliases: SimCiRat SimCiRat.default SimCiRat.formula
### Keywords: htest

### ** Examples

# Example 1:
# Simultaneous confidence intervals related to a comparison of the groups
# B and H against the standard S, for endpoint Thromb.count, assuming unequal
# variances for the groups. This is an extension of the well-known Dunnett-
# intervals to the case of heteroscedasticity and in terms of ratios of means
# instead of differences.

data(coagulation)

interv1 <- SimCiRat(data=coagulation, grp="Group", resp="Thromb.count",
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
interv1
plot(interv1)

# Example 2:
# Simultaneous confidence intervals related to a comparisons of the groups
# B and H against the standard S, simultaneously for all endpoints, assuming
# unequal covariance matrices for the groups. This is an extension of the well-
# known Dunnett-intervals to the case of heteroscedasticity and multiple
# endpoints and in terms of ratios of means instead of differences.

data(coagulation)

interv2 <- SimCiRat(data=coagulation, grp="Group", resp=c("Thromb.count","ADP","TRAP"),
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
summary(interv2)
plot(interv2)



