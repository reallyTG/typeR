library(GUniFrac)


### Name: GUniFrac
### Title: Generalized UniFrac distances for comparing microbial
###   communities.
### Aliases: GUniFrac
### Keywords: distance UniFrac ecology

### ** Examples

require(ade4)

data(throat.otu.tab)
data(throat.tree)
data(throat.meta)

groups <- throat.meta$SmokingStatus

# Rarefaction
otu.tab.rff <- Rarefy(throat.otu.tab)$otu.tab.rff

# Calculate the UniFracs
unifracs <- GUniFrac(otu.tab.rff, throat.tree, alpha=c(0, 0.5, 1))$unifracs

dw <- unifracs[, , "d_1"]		# Weighted UniFrac
du <- unifracs[, , "d_UW"]		# Unweighted UniFrac	
dv <- unifracs[, , "d_VAW"]		# Variance adjusted weighted UniFrac
d0 <- unifracs[, , "d_0"]     	# GUniFrac with alpha 0  
d5 <- unifracs[, , "d_0.5"]   	# GUniFrac with alpha 0.5 

# Permanova - Distance based multivariate analysis of variance
adonis(as.dist(d5) ~ groups)

# PCoA plot
s.class(cmdscale(d5, k=2), fac = groups) 




