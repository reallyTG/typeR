library(spMC)


### Name: embed_MC
### Title: Transition Probabilities Estimation for Embedded Markov Chain
### Aliases: embed_MC
### Keywords: spatial distribution models

### ** Examples
## No test: 
data(ACM)
direction <- c(0, 0, 1)

# Compute the appertaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction, pi/8)

# Estimate the embedded transition probabilities
# matrix for the categorical variable MAT5
embed_MC(ACM$MAT5, ACM[, 1:3], loc.id, direction)

# Estimate the embedded transition probabilities
# matrix for the categorical variable MAT3
embed_MC(ACM$MAT3, ACM[, 1:3], loc.id, direction)

# Estimate the embedded transition probabilities
# matrix for the categorical variable PERM
embed_MC(ACM$PERM, ACM[, 1:3], loc.id, direction)
## End(No test)


