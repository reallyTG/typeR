library(pcrsim)


### Name: simProfile
### Title: DNA Profile Simulator
### Aliases: simProfile

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
df <- data.frame(Marker=markers, Allele=alleles)

# Simulate sample
res <- simProfile(data=df, sim=10, name="Test")
print(res)



