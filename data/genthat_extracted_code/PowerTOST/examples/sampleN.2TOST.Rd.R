library(PowerTOST)


### Name: sampleN.2TOST
### Title: Sample size based on power of two TOSTs
### Aliases: sampleN.2TOST

### ** Examples

# Sample size for 2x2x2 cross-over design, intra-subject CV = 30% and assumed
# ratios of 0.95 for both parameters, and correlation 0.9 between parameters
# (using all the other default values)
# Should give n=44 with power=0.80684
sampleN.2TOST(theta0 = rep(0.95, 2), CV = rep(0.3, 2), rho = 0.9)

# Sample size for a parallel group design,
# evaluation on the original (untransformed) scale
# BE limits 80 ... 120% = -20% ... +20% of reference,
# assumed true BE ratio 0.95% = -5% to reference mean for both parameters,
# total CV=20% for both parameters, and correlation 0.9 between parameters
# should give n=54 with power=0.8149
sampleN.2TOST(logscale=FALSE, theta0 = rep(-0.05, 2), CV = c(0.2, 0.2), 
              rho = 0.9, design = "parallel")



