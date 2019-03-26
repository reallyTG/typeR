library(binMto)


### Name: nbinMto
### Title: Sample size iteration for many-to-one comparisons of binomials
### Aliases: nbinMto
### Keywords: htest

### ** Examples


# Iterate the sample size necessary to achieve
# a power of 80% to reject the null of no treatment
# effects in a dose-response trial for comparing 
# four doses with placebo. The assumed proportions
# of success are 0.45 for the placebo,
# and 0.45, 0.5, 0.5, 0.6  for the increasing doses.
# Assume that only an increase of response is of interest:
# alternative="greater"

# a) use a balanced design: ratio=1

nbinMto(Ntotal = c(800, 1200), pH1=c(0.45, 0.45, 0.5, 0.5, 0.6),
 ratio = 1, alpha = 0.05, power = 0.8, 
 alternative = "greater", method = "Wald", trace = FALSE)

# Compare with the results in Bretz and Hothorn (2002),
# Table III. Note, that in the present function unpooled
# variance estimators are used, while Bretz and Hothorn use 
# a pooled variance estimator.
# Note further, that there is some Monte Carlo Error in computing
# multivariate normal probabilities.




