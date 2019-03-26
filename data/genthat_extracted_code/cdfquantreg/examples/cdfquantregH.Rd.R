library(cdfquantreg)


### Name: cdfquantregH
### Title: Zero/One inflated CDF-Quantile Probability Distributions
### Aliases: cdfquantregH

### ** Examples

data(cdfqrExampleData)
# For one-inflated model
ipcc_high <- subset(IPCC, mid == 1 & high == 1 & prob!=0)
fit <- cdfquantregH(prob ~ valence | valence,one.fo = ~valence,
  fd ='t2',sd ='t2', type = "OI", data = ipcc_high)

summary(fit)

# For zero-inflated model
ipcc_low <- subset(IPCC, mid == 0 & high == 0 & prob!=1)
fit <- cdfquantregH(prob ~ valence | valence, zero.fo = ~valence,
  fd ='t2',sd ='t2', type = "ZI", data = ipcc_low)
 
 
# For zero &one-inflated model
ipcc_mid <- subset(IPCC, mid == 1 & high == 0)
fit <- cdfquantregH(prob ~ valence | valence, zero.fo = ~valence,
  one.fo = ~valence,
  fd ='t2',sd ='t2', type = "ZO", data = ipcc_mid)
 
  



