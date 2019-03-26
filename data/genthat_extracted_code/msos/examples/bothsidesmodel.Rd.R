library(msos)


### Name: bothsidesmodel
### Title: Calculate the least squares estimates
### Aliases: bothsidesmodel

### ** Examples

# Mouth Size Example from 6.4.1
data(mouths)
x <- cbind(1, mouths[, 5])
y <- mouths[, 1:4]
z <- cbind(c(1, 1, 1, 1), c(-3, -1, 1, 3), c(1, -1, -1, 1), c(-1, 3, -3, 1))
bothsidesmodel(x, y, z)



