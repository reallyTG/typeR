library(labstats)


### Name: block.covars
### Title: Data to compare the use of blocking and covariate adjustment
### Aliases: block.covars

### ** Examples

# Randomised block design
summary(aov(y.RBD ~ factor(block) + RBD, data=block.covars))

# Completely randomised design with weight as a covariate
summary(aov(y.CRD ~ weight + CRD, data=block.covars))



