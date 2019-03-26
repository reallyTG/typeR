library(iGasso)


### Name: VSTF.test
### Title: Association Tests for Rare Variants Based on
###   Variance-Stabilizing Transformation
### Aliases: VSTF.test

### ** Examples

## Example 1 of Li et al. (2010)
G = rbind(c(14, 999), c(3, 1081))
VSTF.test(G)
VSTF.test(G, method = "arcsine")
VSTF.test(G, method = "Freeman-Tukey")



