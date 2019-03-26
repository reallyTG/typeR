library(MiSPU)


### Name: GUniFrac
### Title: Generalized UniFrac distances for comparing microbial
###   communities.
### Aliases: GUniFrac
### Keywords: distance UniFrac ecology

### ** Examples

data(throat.otu.tab)
data(throat.tree)
data(throat.meta)

groups <- throat.meta$SmokingStatus

# Calculate the UniFracs
unifracs <- GUniFrac(throat.otu.tab, throat.tree)
unifracs



