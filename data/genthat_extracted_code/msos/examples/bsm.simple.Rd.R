library(msos)


### Name: bsm.simple
### Title: Helper function to determine beta estimates for MLE regression.
### Aliases: bsm.simple

### ** Examples

# Taken from section 9.3.3 to show equivalence to methods.
data(mouths)
x <- cbind(1, mouths[, 5])
y <- mouths[, 1:4]
z <- cbind(1, c(-3, -1, 1, 3), c(-1, 1, 1, -1),c(-1, 3, -3, 1))
yz <- y %*% solve(t(z))
yza <- yz[, 1:2]
xyzb <- cbind(x, yz[, 3:4])
lm(yza ~ xyzb - 1)
bsm.simple(xyzb, yza, diag(2))



