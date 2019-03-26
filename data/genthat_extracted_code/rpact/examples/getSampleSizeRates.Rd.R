library(rpact)


### Name: getSampleSizeRates
### Title: Get Sample Size Rates
### Aliases: getSampleSizeRates

### ** Examples


# Calculate sample sizes n1Fixed, n2Fixed, nFixed, and the optimum 
# allocation ratios for a range of pi1 values when testing 
# H0: pi1 - pi2 = -0.1:
getSampleSizeRates(getDesignGroupSequential(alpha = 0.025, beta = 0.2, 
    sided = 1), groups = 2, thetaH0 = -0.1, pi1 = seq(0.4, 0.55, 0.025), 
    pi2 = 0.4, normalApproximation = TRUE, allocationRatioPlanned = 0)

# Calculate sample sizes n1Fixed, n2Fixed, nFixed, and the optimum 
# allocation ratios for a range of pi2 values when testing 
# H0: pi1 / pi2 = 1.25:
getSampleSizeRates(getDesignGroupSequential(alpha = 0.025, beta = 0.2, 
    sided = 1), groups = 2, riskRatio = TRUE, thetaH0 = 1.25, pi1 = 0.3, 
    pi2 = 0.3, normalApproximation = TRUE, allocationRatioPlanned = 1)




