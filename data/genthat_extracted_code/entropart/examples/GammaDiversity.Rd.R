library(entropart)


### Name: GammaDiversity
### Title: Reduced-bias gamma diversity of a metacommunity
### Aliases: GammaDiversity

### ** Examples

# Load Paracou data (number of trees per species in two 1-ha plot of a tropical forest)
data(Paracou618)
# Calculate Simpson gamma diversity
GammaDiversity(Paracou618.MC, 2)
# Compare without correction
GammaDiversity(Paracou618.MC, 2, Correction = "None")
# Estimate phylogenetic Simpson gamma diversity
GammaDiversity(Paracou618.MC, 2, Tree = Paracou618.Taxonomy)   



