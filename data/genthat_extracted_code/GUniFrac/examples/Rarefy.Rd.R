library(GUniFrac)


### Name: Rarefy
### Title: Rarefy the OTU table to an equal sequencing depth
### Aliases: Rarefy
### Keywords: Rarefaction Ecology

### ** Examples

data(throat.otu.tab)
# Rarefaction
otu.tab.rff <- Rarefy(throat.otu.tab, 1024)$otu.tab.rff



