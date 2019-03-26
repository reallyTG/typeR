library(spMC)


### Name: mlen
### Title: Mean Length Estimation for Embedded Markov Chain
### Aliases: mlen
### Keywords: spatial

### ** Examples
## No test: 
data(ACM)
direction <- c(0,0,1)

# Compute the appartaining directional line for each location
loc.id <- which_lines(ACM[, 1:3], direction)

# Estimate the mean lengths for each observed category
ml <- mlen(ACM$MAT5, ACM[, 1:3], loc.id, direction, mle = "avg")

# Equivalently
gl <- getlen(ACM$MAT5, ACM[, 1:3], loc.id, direction, zero.allowed = TRUE)
ml1 <- tapply(gl$length, gl$categories, mean)
## End(No test)


