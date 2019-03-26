library(entropart)


### Name: BetaDiversity
### Title: Reduced-bias beta diversity of a metacommunity
### Aliases: BetaDiversity

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Estimate Shannon beta diversity
summary(BetaDiversity(Paracou618.MC, 1))
# Compare without correction
summary(BetaDiversity(Paracou618.MC, 1, Correction = "None"))
# Estimate phylogenetic Shannon beta diversity
summary(BetaDiversity(Paracou618.MC, 1, Tree = Paracou618.Taxonomy) -> e)



