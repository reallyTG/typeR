library(SimComp)


### Name: plot.SimCi
### Title: Plot function for SimCi-objects
### Aliases: plot.SimCi
### Keywords: print

### ** Examples

# Example 1:
# Simultaneous confidence intervals related to a comparison of the groups
# B and H against the standard S, on endpoint Thromb.count, assuming unequal
# variances for the groups. This is an extension of the well-known Dunnett-
# intervals to the case of heteroscedasticity.

data(coagulation)

interv1 <- SimCiDiff(data=coagulation, grp="Group", resp="Thromb.count",
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
interv1
plot(interv1)

# Example 2:
# Simultaneous confidence intervals related to a comparisons of the groups
# B and H against the standard S, simultaneously on all endpoints, assuming
# unequal covariance matrices for the groups. This is an extension of the well-
# known Dunnett-intervals to the case of heteroscedasticity and multiple
# endpoints.

data(coagulation)

interv2 <- SimCiDiff(data=coagulation, grp="Group", resp=c("Thromb.count","ADP","TRAP"),
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
summary(interv2)
par(mfrow=c(1,3)); plot(interv2)



