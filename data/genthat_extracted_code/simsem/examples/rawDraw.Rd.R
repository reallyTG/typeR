library(simsem)


### Name: rawDraw
### Title: Draw values from vector or matrix objects
### Aliases: rawDraw

### ** Examples

loading <- matrix(0, 7, 3)
loading[1:3, 1] <- NA
loading[4:6, 2] <- NA
loading[1:7, 3] <- NA
loadingVal <- matrix(0, 7, 3)
loadingVal[1:3, 1] <- "runif(1, 0.5, 0.7)"
loadingVal[4:6, 2] <- "runif(1, 0.5, 0.7)"
loadingVal[1:6, 3] <- "runif(1, 0.3, 0.5)"
loadingVal[7, 3] <- 1
loading.mis <- matrix("runif(1, -0.2, 0.2)", 7, 3)
loading.mis[is.na(loading)] <- 0
loading.mis[,3] <- 0
loading.mis[7,] <- 0
loading[1:3, 1] <- "con1"
LY <- bind(loading, loadingVal, misspec=loading.mis)

# Draw values
rawDraw(LY)

# Draw only model parameters containing misspecification
rawDraw(LY, parMisOnly=TRUE)

# Draw only misspecification.
rawDraw(LY, misOnly=TRUE)



