# TODO:   Steps to check
# 
# Author: Miguel Alvarez
################################################################################

library(taxlist)

data(Easplist)

Spp1 <- subset(Easplist, TaxonName == "Erigeron floribundus")
Spp2 <- tnrs(Spp1)
## Undesirable behaviour
