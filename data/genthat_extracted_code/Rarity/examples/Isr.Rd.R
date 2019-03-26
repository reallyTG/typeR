library(Rarity)


### Name: Isr
### Title: Index of Summed Rarity
### Aliases: Isr Isr,data.frame,data.frame-method
###   Isr,data.frame,matrix-method Isr,data.frame,vector-method
###   Isr,matrix,data.frame-method Isr,matrix,matrix-method
###   Isr,matrix,vector-method Isr,vector,data.frame-method
###   Isr,vector,matrix-method Isr,vector,vector-method

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

# Calculation of Isr
Isr(assemblages.matrix, rarity.weights)
Isr(assemblages.matrix, rarity.weights, normalise = TRUE)


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

# Calculation of Isr
Isr(assemblages.matrix, rarity.weights)
Isr(assemblages.matrix, rarity.weights, normalise = TRUE)



