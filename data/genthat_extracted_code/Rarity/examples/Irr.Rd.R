library(Rarity)


### Name: Irr
### Title: Index of Relative Rarity
### Aliases: Irr Irr,data.frame,data.frame-method
###   Irr,data.frame,matrix-method Irr,data.frame,vector-method
###   Irr,matrix,data.frame-method Irr,matrix,matrix-method
###   Irr,matrix,vector-method Irr,vector,data.frame-method
###   Irr,vector,matrix-method Irr,vector,vector-method

### ** Examples

# Input rarity weights
data(spid.occ)

# Example of a single scale dataset
regional.occ <- spid.occ$occurMA
names(regional.occ) <- rownames(spid.occ)
head(regional.occ)

# Preparation of rarity weights
rarity.weights <- rWeights(regional.occ)

# Generation of an assemblage matrix
assemblages.matrix <- cbind(assemblage.1 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.2 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.3 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.4 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.5 = sample(c(0, 1), 50, replace = TRUE))
# Random attribution of names to the sampled species
rownames(assemblages.matrix) <- sample(names(regional.occ), 50, replace = FALSE)
head(assemblages.matrix)

# Calculation of Irr
Irr(assemblages.matrix, rarity.weights)


# Example of a multi scale dataset
rarity.weights <- rWeights(spid.occ, extended = TRUE)
head(rarity.weights)

# Generation of an assemblage matrix
assemblages.matrix <- cbind(assemblage.1 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.2 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.3 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.4 = sample(c(0, 1), 50, replace = TRUE),
                            assemblage.5 = sample(c(0, 1), 50, replace = TRUE))
rownames(assemblages.matrix) <- sample(names(regional.occ), 50, replace = FALSE)
head(assemblages.matrix)

# Calculation of Irr
Irr(assemblages.matrix, rarity.weights)



