library(msos)


### Name: bothsidesmodel.hotelling
### Title: Test blocks of beta are zero.
### Aliases: bothsidesmodel.hotelling

### ** Examples

# Finds the Hotelling values for example 7.3.1
data(mouths)
x <- cbind(1, mouths[,5])
y <- mouths[, 1:4]
z <- cbind(c(1, 1, 1, 1), c(-3, -1, 1, 3), c(1, -1, -1, 1), c(-1, 3, -3, 1))
bothsidesmodel.hotelling(x, y, z, 1:2, 3:4)



