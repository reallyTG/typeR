library(pcrsim)


### Name: simCE
### Title: CE Simulator
### Aliases: simCE

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
df <- data.frame(Marker=markers, Allele=alleles)

# Simulate profile.
res <- simProfile(data=df, sim=5, name="Test")

# Simulate sample
res <- simSample(data=res, cells=58, sd.cells=0)

# Simulate extraction.
res <- simExtraction(data=res, vol.ex=1, sd.vol=0, prob.ex=1, sd.prob=0)

# Simulate PCR.
res <- simPCR(data=res, kit=NULL, pcr.cyc=30, vol.aliq=1, sd.vol.aliq=0, vol.pcr=25, sd.vol.pcr=0)

# Simulate CE.
res <- simCE(data=res, vol=1, sd.vol=0, intercept=-10.48, slope=0.86, sigma=0.58)
print(res)



