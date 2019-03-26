library(aod)


### Name: anova-methods
### Title: Likelihood-Ratio Tests for Nested ML Models
### Aliases: anova,glimML-method anova.glimML-class
###   show,anova.glimML-method
### Keywords: regression

### ** Examples

  data(orob2)
  # likelihood ratio test for the effect of root
  fm1 <- betabin(cbind(y, n - y) ~ seed, ~ 1, data = orob2)
  fm2 <- betabin(cbind(y, n - y) ~ seed + root, ~ 1, data = orob2)
  anova(fm1, fm2)
  


