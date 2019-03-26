library(SimComp)


### Name: DfSattRat
### Title: Degrees of Freedom Accoding to Satterthwaite (1946) for Ratios
###   of Means
### Aliases: DfSattRat
### Keywords: math misc

### ** Examples

# Example 1:
# Degrees of freedom for a non-inferiority test of group two and three against group one,
# assuming unequal standard deviations for the groups. This is an extension for the well-
# known Dunnett-test to the case of heteroscedasticity and in terms of ratios of means
# instead of differences.

# Either by specifying the type of contrast:
DfSattRat(n=c(10,6,6), sd=c(1,3,6), type="Dunnett", base=1, Margin=0.8)

# Or by specifying the contrast matrices:
DfSattRat(n=c(10,6,6), sd=c(1,3,6), Num.Contrast=rbind(c(0,1,0),c(0,0,1)),
  Den.Contrast=rbind(c(1,0,0),c(1,0,0)), Margin=0.8)

# Example 2:
# Degrees of freedom for an all-pair comparison of the groups B, H and S on endpoint ADP,
# assuming unequal standard deviations for the groups. This is an extension for the well-
# known Tukey-test to the case of heteroscedasticity and in terms of ratios of means
# instead of differences. The same degrees of freedom are used automatically by command 
# \code{SimTestRat()}.

data(coagulation)

DfSattRat(n=tapply(X=coagulation$ADP, INDEX=coagulation$Group, FUN=length),
  sd=tapply(X=coagulation$ADP, INDEX=coagulation$Group, FUN=sd),
  type="Tukey")



