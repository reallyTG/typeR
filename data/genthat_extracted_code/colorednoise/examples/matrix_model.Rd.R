library(colorednoise)


### Name: matrix_model
### Title: Temporally Autocorrelated Matrix Population Models
### Aliases: matrix_model

### ** Examples

meanMat <- matrix(c(0.55, 0.6, 0.24, 0.4), byrow = TRUE, ncol = 2)
sdMat <- matrix(c(0.3, 0.35, 0.05, 0.1), byrow = TRUE, ncol = 2)
phiMat <- matrix(c(-0.2, -0.2, 0, 0), byrow = TRUE, ncol = 2)
initialPop <- c(100, 100)
sim <- matrix_model(list(meanMat, sdMat, phiMat), initialPop, 50)
head(sim)



