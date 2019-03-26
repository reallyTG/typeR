library(joineR)


### Name: variogram
### Title: Empirical variogram for longitudinal data
### Aliases: variogram
### Keywords: models smooth

### ** Examples

data(mental)
mental.unbalanced <- to.unbalanced(mental, id.col = 1, 
                                   times = c(0, 1, 2, 4, 6, 8),
                                   Y.col = 2:7, 
                                   other.col = c(8, 10, 11))
names(mental.unbalanced)[3] <- "Y"

vgm <- variogram(indv = tail(mental.unbalanced[, 1], 30),
                 time = tail(mental.unbalanced[, 2], 30),
                 Y = tail(mental.unbalanced[, 3], 30))



