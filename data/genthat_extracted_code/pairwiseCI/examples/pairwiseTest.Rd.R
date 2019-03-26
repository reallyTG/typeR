library(pairwiseCI)


### Name: pairwiseTest
### Title: Wrapper to calculate unadjusted p-values for pairwise
###   comparisons
### Aliases: pairwiseTest
### Keywords: htest

### ** Examples


#######################################################
# The rooting example:
# Calculate confidence intervals for the 
# difference of proportions between the 3 doses of IBA,
# separately for 4 combinations of "Age" and "Position".
# Note: we pool over Rep in that way. Whether this makes
# sense or not, is decision of the user.

data(rooting)

# Pairwise Chi-square tests:

aproots<-pairwiseTest(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.test")

aproots

# With Holm adjustment for multiple hypotheses testing:

summary(aproots, p.adjust.method="holm")


#########################################################

data(Oats)


apc <- pairwiseTest(yield ~ nitro, data=Oats,
 by="Variety", method="wilcox.test")

apc

summary(apc)
summary(apc, p.adjust.method="holm")

  


