library(ltm)


### Name: biserial.cor
### Title: Point-Biserial Correlation
### Aliases: biserial.cor
### Keywords: multivariate

### ** Examples


# the point-biserial correlation between
# the total score and the first item, using
# '0' as the reference level
biserial.cor(rowSums(LSAT), LSAT[[1]])

# and using '1' as the reference level
biserial.cor(rowSums(LSAT), LSAT[[1]], level = 2)




