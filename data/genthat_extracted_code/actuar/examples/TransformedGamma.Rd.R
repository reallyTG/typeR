library(actuar)


### Name: TransformedGamma
### Title: The Transformed Gamma Distribution
### Aliases: TransformedGamma dtrgamma ptrgamma qtrgamma rtrgamma mtrgamma
###   levtrgamma
### Keywords: distribution

### ** Examples

exp(dtrgamma(2, 3, 4, 5, log = TRUE))
p <- (1:10)/10
ptrgamma(qtrgamma(p, 2, 3, 4), 2, 3, 4)
mtrgamma(2, 3, 4, 5) - mtrgamma(1, 3, 4, 5) ^ 2
levtrgamma(10, 3, 4, 5, order = 2)



