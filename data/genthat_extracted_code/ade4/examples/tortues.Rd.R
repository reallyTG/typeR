library(ade4)


### Name: tortues
### Title: Morphological Study of the Painted Turtle
### Aliases: tortues
### Keywords: datasets

### ** Examples

data(tortues)
xyz <- as.matrix(tortues[, 1:3])
ref <- -svd(xyz)$u[, 1]
pch0 <- c(1, 20)[as.numeric(tortues$sexe)]
plot(ref, xyz[, 1], ylim = c(40, 180), pch = pch0)
abline(lm(xyz[, 1] ~ -1 + ref))
points(ref,xyz[, 2], pch = pch0)
abline(lm(xyz[, 2] ~ -1 + ref))
points(ref,xyz[, 3], pch = pch0)
abline(lm(xyz[, 3] ~ -1 + ref))



