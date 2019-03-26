library(BayHaz)


### Name: BPSevalHR
### Title: Function to Evaluate BPS Hazard Rates
### Aliases: BPSevalHR
### Keywords: survival

### ** Examples

# set RNG seed (for example reproducibility only)
set.seed(1234)

# select a BPS prior distribution
hypars<-BPSpriorElicit(r0 = 0.1, H = 1, T00 = 50, ord = 4, G = 3, c = 0.9)
# generate a sample of ten hazard rates
prior<-BPSpriorSample(ss = 10, hyp = hypars)

# evaluate the ten hazard rates at year multiples
BPSevalHR(time = seq(0,50), sample = prior)



