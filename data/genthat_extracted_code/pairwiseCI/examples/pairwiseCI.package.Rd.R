library(pairwiseCI)


### Name: pairwiseCI-package
### Title: Wrapper functions for two-sample confidence intervals and tests.
### Aliases: pairwiseCI-package
### Keywords: package htest

### ** Examples


# some examples:
# In many cases the shown examples might not make sense,
# but display how the functions can be used.

data(Oats)
Oats

# # all pairwise comparisons,
# separately for each level of nitro:

apc <- pairwiseCI(yield ~ Variety, data=Oats,
 by="nitro", method="Param.diff")

apc

# Intervals can be plotted:

plot(apc)

# See ?pairwiseCI or ?pairwiseCImethodsCont
# for further options for intervals of 2 samples
# of continuous data.


# Or a test

apcTest <- pairwiseTest(yield ~ Variety, data=Oats,
 by="nitro", method="t.test")

# with holm-adjusted p-values:
summary(apcTest, p.adjust.method="holm")



# # If only comparisons to one control would be of interest:
# many to one comparisons, with variety Marvellous as control,
# for each level of nitro separately:

m21 <- pairwiseCI(yield ~ Variety, data=Oats,
 by="nitro", method="Param.diff", control="Marvellous")


##############################################
# # Proportions: another structure of the data is needed.
# Currently the data.frame data must contain two columns,
# specifying the number of successes and failures on each 
# unit.

# The rooting example:
# Calculate confidence intervals for the 
# difference of proportions between the 3 doses of IBA,
# separately for 4 combinations of "Age" and "Position".
# Note: we pool over Rep in that way. Whether this makes
# sense or not, is decision of the user.

data(rooting)
rooting

# Confidence intervals for the risk difference

aprootsRD<-pairwiseCI(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.diff")

# See ?pairwiseCIProp for further options to compare proportions

# Or a test:

aprootsTest<-pairwiseTest(cbind(root, noroot) ~ IBA,
 data=rooting, by=c("Age", "Position"), method="Prop.test")
aprootsTest

summary(aprootsTest, p.adjust.method="holm")




