library(vdg)


### Name: LHS
### Title: Latin Hypercube Sampling
### Aliases: LHS MLHS RSLHS SLHS
### Keywords: design

### ** Examples


set.seed(1234)
pts <- seq(-1, 1, length = 11)

# Ordinary LHS
samp <- LHS(n = 10, m = 2)
plot(samp, main = "LHS")
abline(h = pts, v = pts, col = "lightgrey")

# Midpoint LHS
samp <- MLHS(n = 10, m = 2)
plot(samp, main = "MLHS")
abline(h = pts, v = pts, col = "lightgrey")

# Symmetric LHS
samp <- SLHS(n = 10, m = 2)
plot(samp, main = "SLHS")
abline(h = pts, v = pts, col = "lightgrey")

# Randomized Symmetric LHS
samp <- RSLHS(n = 10, m = 2)
plot(samp, main = "RSLHS")
abline(h = pts, v = pts, col = "lightgrey")



