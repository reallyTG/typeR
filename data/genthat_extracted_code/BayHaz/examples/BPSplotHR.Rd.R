library(BayHaz)


### Name: BPSplotHR
### Title: Function to Plot BPS Hazard Rates
### Aliases: BPSplotHR
### Keywords: hplot survival

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a BPS prior distribution
hypars<-BPSpriorElicit(r0 = 0.1, H = 1, T00 = 50, ord = 4, G = 3, c = 0.9)
# generate a sample of ten hazard rates
prior<-BPSpriorSample(ss = 10, hyp = hypars)

# plot the ten hazard rates
BPSplotHR(prior, tu = "Year")



