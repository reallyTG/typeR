library(pcrsim)


### Name: simPCR
### Title: PCR Simulator
### Aliases: simPCR

### ** Examples

# Create a data frame with a DNA profile.
markers = rep(c("D3S1358","TH01","FGA"), each=2)
alleles = c(15,18,6,10,25,25)
df <- data.frame(Marker=markers, Allele=alleles)

# Simulate profile.
smpl <- simProfile(data=df, sim=10)

# Simulate sample.
smpl <- simSample(data=smpl, cells=1000, sd.cells=200)

# Simulate extraction.
smpl <- simExtraction(data=smpl, vol.ex=200, sd.vol=10, prob.ex=0.6, sd.prob=0.1)

# Simulate PCR with 95% PCR efficiency and 0.2% stutter probability for all loci.
res <- simPCR(data=smpl, pcr.prob=0.95, pcr.cyc=30, vol.aliq=10,
 sd.vol.aliq=0.1, vol.pcr=25, sd.vol.pcr=1)

# Simulate PCR with locus specific PCR efficiency and stutter probability.
res <- simPCR(data=smpl, kit="ESX17", pcr.cyc=30, vol.aliq=10,
 sd.vol.aliq=0.1, vol.pcr=25, sd.vol.pcr=1)

# Simulate PCR with locus specific PCR efficiency and stutter probability.
res <- simPCR(data=smpl, kit="ESX17", pcr.cyc=30, vol.aliq=10,
 sd.vol.aliq=0.1, vol.pcr=25, sd.vol.pcr=1, stutter.reg=TRUE)



