library(actuar)


### Name: InverseTransformedGamma
### Title: The Inverse Transformed Gamma Distribution
### Aliases: InverseTransformedGamma dinvtrgamma pinvtrgamma qinvtrgamma
###   rinvtrgamma minvtrgamma levinvtrgamma
### Keywords: distribution

### ** Examples

exp(dinvtrgamma(2, 3, 4, 5, log = TRUE))
p <- (1:10)/10
pinvtrgamma(qinvtrgamma(p, 2, 3, 4), 2, 3, 4)
minvtrgamma(2, 3, 4, 5)
levinvtrgamma(200, 3, 4, 5, order = 2)



