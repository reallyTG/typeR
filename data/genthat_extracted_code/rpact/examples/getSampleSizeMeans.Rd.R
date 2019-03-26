library(rpact)


### Name: getSampleSizeMeans
### Title: Get Sample Size Means
### Aliases: getSampleSizeMeans

### ** Examples


# Calculate sample sizes n1Fixed, n2Fixed, and 
# nFixed for a range of alternative values:
getSampleSizeMeans(getDesignGroupSequential(alpha = 0.025, sided = 1), 
    groups = 2, alternative = seq(0.1, 2, 0.2), 
    normalApproximation = FALSE, allocationRatioPlanned = 2)




