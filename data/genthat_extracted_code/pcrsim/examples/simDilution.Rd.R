library(pcrsim)


### Name: simDilution
### Title: Serial Dilution Simulator
### Aliases: simDilution

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
res <- data.frame(Marker=markers, Allele=alleles)

# Simulate profile.
res <- simProfile(data=res, sim=3, name="Test")

# Simulate diploid sample.
res <- simSample(data=res, cells=10000, sd.cells=200)

# Simulate extraction.
res <- simExtraction(data=res, vol.ex=200, sd.vol=10, prob.ex=0.3, sd.prob=0.1)

# Simulate dilution.
res <- simDilution(data=res, amount=1, dilution.factor=0.5)



