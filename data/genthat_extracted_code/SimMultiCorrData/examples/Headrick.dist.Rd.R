library(SimMultiCorrData)


### Name: Headrick.dist
### Title: Examples of Constants Calculated by Headrick's Fifth-Order
###   Polynomial Transformation
### Aliases: Headrick.dist
### Keywords: datasets

### ** Examples

z <- rnorm(10000)
g <- Headrick.dist$Gamma_a10b10[-c(1:4)]
gamma_a10b10 <- g[1] + g[2] * z + g[3] * z^2 + g[4] * z^3 + g[5] * z^4 +
                g[6] * z^5
summary(gamma_a10b10)



