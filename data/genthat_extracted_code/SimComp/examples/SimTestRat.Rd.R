library(SimComp)


### Name: SimTestRat
### Title: Simultaneous Tests for General Contrasts (Ratios) of Means of
###   Multiple Endpoints
### Aliases: SimTestRat SimTestRat.default SimTestRat.formula
### Keywords: htest

### ** Examples

# Example 1:
# A comparison of the groups B and H against the standard S, for endpoint
# Thromb.count, assuming unequal variances for the groups. This is an
# extension of the well-known Dunnett-test to the case of heteroscedasticity 
# and in terms of ratios of means instead of differences.

data(coagulation)

comp1 <- SimTestRat(data=coagulation, grp="Group", resp="Thromb.count",
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
comp1

# Example 2:
# A comparison of the groups B and H against the standard S, simultaneously
# for all endpoints, assuming unequal covariance matrices for the groups. This is
# an extension of the well-known Dunnett-test to the case of heteroscedasticity
# and multiple endpoints and in terms of ratios of means instead of differences.

data(coagulation)

comp2 <- SimTestDiff(data=coagulation, grp="Group", resp=c("Thromb.count","ADP","TRAP"),
  type="Dunnett", base=3, alternative="greater", covar.equal=FALSE)
summary(comp2)



