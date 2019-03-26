library(SpecDetec)


### Name: Spec
### Title: Calculate change points with spectral cluster
### Aliases: Spec

### ** Examples

data <- DEVICE1[, 1]
realChangePoints <- c(which(diff(DEVICE1$Class) != 0)) 
calculateChangePoints <- Spec(data, neighboorsNumber = 6, 
         tolerance = 0.005, estimationChangePointsNumber = 2)
minValue <- -99999
maxValue <- 99999
plot(data, type = "l", xlab = "x", ylab = "y")
for (r in 1:length(realChangePoints)) {
    lines(x = c(realChangePoints[r], realChangePoints[r]), 
          y = c(minValue, maxValue), lwd = 2, col = "red")
}
for (n in 1:length(calculateChangePoints)) {
 lines(x = c(calculateChangePoints[n], calculateChangePoints[n]), 
       y = c(minValue, maxValue), lwd = 2, col = "blue")
}




