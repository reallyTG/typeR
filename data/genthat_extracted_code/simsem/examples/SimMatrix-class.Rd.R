library(simsem)


### Name: SimMatrix-class
### Title: Matrix object: Random parameters matrix
### Aliases: SimMatrix-class summaryShort,SimMatrix-method
###   summary,SimMatrix-method
### Keywords: classes

### ** Examples

showClass("SimMatrix")

loading <- matrix(0, 6, 2)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
loadingValues <- matrix(0, 6, 2)
loadingValues[1:3, 1] <- 0.7
loadingValues[4:6, 2] <- 0.7
LY <- bind(loading, loadingValues)
summary(LY)
rawDraw(LY)

LY <- bind(loading, "rnorm(1, 0.6, 0.05)")
summary(LY)
rawDraw(LY)

mis <- matrix("runif(1, -0.1, 0.1)", 6, 2)
mis[is.na(loading)] <- 0
LY <- bind(loading, "rnorm(1, 0.6, 0.05)", mis)
summary(LY)
rawDraw(LY)



