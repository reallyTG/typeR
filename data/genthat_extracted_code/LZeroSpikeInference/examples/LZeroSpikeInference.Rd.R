library(LZeroSpikeInference)


### Name: LZeroSpikeInference
### Title: LZeroSpikeInference: LZeroSpikeInference: A package for
###   estimating spike times from calcium imaging data using an L0 penalty
### Aliases: LZeroSpikeInference LZeroSpikeInference-package

### ** Examples

# To reproduce Figure 1 of Jewell and Witten (2017) <arXiv:1703.08644>

sampleData <- simulateAR1(n = 500, gam = 0.998, poisMean = 0.009, sd = 0.15, seed = 8)
fit <- estimateSpikes(sampleData$fl, gam = 0.998, lambda = 8, type = "ar1")
plot(fit)




