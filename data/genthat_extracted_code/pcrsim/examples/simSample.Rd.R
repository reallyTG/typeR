library(pcrsim)


### Name: simSample
### Title: Forensic Sample Simulator
### Aliases: simSample

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
df <- data.frame(Marker=markers, Allele=alleles)
# Simulate profile.
prof <- simProfile(data=df, sim=3, name="Test")

# Simulate diploid sample.
res <- simSample(data=prof, cells=100, sd.cells=20)
print(res)

# Simulate haploid sample.
res <- simSample(data=prof, cells=100, sd.cells=20, haploid=TRUE)
print(res)

# Simulate haploid sample from concentration.
res <- simSample(data=prof, conc=0.02, sd.conc=0.001, vol=100, haploid=TRUE)
print(res)

# Simulate sample from slope and intercept.
res <- simSample(data=prof, vol=100, slope=-0.01, intercept=0.20, kit="SGMPlus")
print(res)

# Simulate mixture of diploid and haploid sample types of two concentrations.
res <- simSample(data=prof, cells=c(1000,1000,250), haploid=c(FALSE,TRUE,FALSE))
print(res)



