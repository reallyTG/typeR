library(Rarity)


### Name: Rarity-package
### Title: A package to calculate rarity indices for species and
###   assemblages of species for conservation studies
### Aliases: Rarity-package Rarity
### Keywords: package

### ** Examples

# Example dataset: occurrences of spider species at two different scales
data(spid.occ)
head(spid.occ)

# Calculation of rarity weights
rarity.weights <- rWeights(occData = spid.occ, rCutoff = "Gaston")

# Generation of a random assemblage matrix
assemblages.matrix <- cbind(assemblage.1 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.2 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.3 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.4 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.5 = sample(c(0, 1), 50, replace = TRUE))
# Random attribution of species names
rownames(assemblages.matrix) <- sample(rownames(spid.occ), 50, replace = FALSE)
head(assemblages.matrix)

# Calculation of rarity indices of assemblages
Irr(assemblages = assemblages.matrix, W = rarity.weights)



