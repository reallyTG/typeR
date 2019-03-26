library(Rarity)


### Name: rWeights
### Title: Calculation of rarity weights at a single or at multiple scales
### Aliases: rWeights rWeights-method rWeights,data.frame-method
###   rWeights,matrix-method rWeights,vector-method
### Keywords: ~kwd1 ~kwd2

### ** Examples

# 1. Single scale rarity weights
data(spid.occ)
head(spid.occ)

regional.occ <- spid.occ$occurMA
names(regional.occ) <- rownames(spid.occ)
head(regional.occ)

# Calculation of rarity weights at a single scale:
rWeights(regional.occ, rCutoff = "Gaston")
rWeights(regional.occ, rCutoff = 0.1)
rWeights(regional.occ, wMethods = "invQ")
rWeights(regional.occ, wMethods = c("W", "invQ"))

# Calculation of rarity weights with the method of Leroy
# Creating a fictive assemblage matrix of 5 assemblages
# Warning: this is to provide an example of how the function works!
# The correct use of this method requires a matrix of actually sampled species.
assemblages.matrix <- cbind(assemblage.1 = sample(c(0, 1), 708, replace = TRUE),
                            assemblage.2 = sample(c(0, 1), 708, replace = TRUE),
                            assemblage.3 = sample(c(0, 1), 708, replace = TRUE),
                            assemblage.4 = sample(c(0, 1), 708, replace = TRUE),
                            assemblage.5 = sample(c(0, 1), 708, replace = TRUE))
rownames(assemblages.matrix) <- names(regional.occ) # Rownames of assemblages.matrix must 
                                                 # correspond to rownames in occurrences
head(assemblages.matrix)
                                          
rWeights(regional.occ, wMethods = "W", rCutoff = "Leroy", assemblages = assemblages.matrix)

# 2. Multiscale rarity weights
data(spid.occ)
head(spid.occ)

rWeights(spid.occ, wMethods = "W", rCutoff = "Gaston")
rWeights(spid.occ, wMethods = "W", rCutoff = "Gaston", extended = TRUE)
rWeights(spid.occ, wMethods = c("W", "invQ"), rCutoff = "Gaston", extended = TRUE)
rWeights(spid.occ, wMethods = c("W", "invQ"), rCutoff = "Leroy", 
         assemblages = assemblages.matrix, extended = TRUE) # Provided that you have 
                                             # created "assemblages.matrix" as above



