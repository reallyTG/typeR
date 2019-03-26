library(pcrsim)


### Name: simExtraction
### Title: DNA Extraction Simulator
### Aliases: simExtraction

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
df <- data.frame(Marker=markers, Allele=alleles)

# Simulate profile.
res <- simProfile(data=df, sim=3, name="Test")

# Simulate diploid sample.
res <- simSample(data=res, cells=100, sd.cells=20)

# [OPTIONAL] Simulate degradation.
res <- simDegradation(data=res, kit="ESX17", deg=0.003, quant.target=80)

# Simulate extraction.
res <- simExtraction(data=res, vol.ex=200, sd.vol=10, prob.ex=0.3, sd.prob=0.1)



