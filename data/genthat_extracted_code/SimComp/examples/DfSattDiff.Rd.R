library(SimComp)


### Name: DfSattDiff
### Title: Degrees of Freedom Accoding to Satterthwaite (1946) for
###   Differences of Means
### Aliases: DfSattDiff
### Keywords: math misc

### ** Examples

# Example 1:
# Degrees of freedom for a comparison of group two and three against group one, assuming
# unequal standard deviations for the groups. This is an extension for the well-known
# Dunnett-test to the case of heteroscedasticity.

# Either by specifying the type of contrast:
DfSattDiff(n=c(10,6,6), sd=c(1,3,6), type="Dunnett", base=1)

# Or by specifying the contrast matrix:
DfSattDiff(n=c(10,6,6), sd=c(1,3,6), ContrastMat=rbind(c(-1,1,0),c(-1,0,1)))

# Example 2:
# Degrees of freedom for an all-pair comparison of the groups B, H and S on endpoint ADP,
# assuming unequal standard deviations for the groups. This is an extension for the well-
# known Tukey-test to the case of heteroscedasticity. The same degrees of freedom are 
# used automatically by command \code{SimTestDiff()}.

data(coagulation)

DfSattDiff(n=tapply(X=coagulation$ADP, INDEX=coagulation$Group, FUN=length),
  sd=tapply(X=coagulation$ADP, INDEX=coagulation$Group, FUN=sd),
  type="Tukey")



