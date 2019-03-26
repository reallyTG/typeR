library(DTWBI)


### Name: gapCreation
### Title: Gap creation
### Aliases: gapCreation

### ** Examples

data(dataDTWBI)
X <- dataDTWBI[, 1]
rate <- 0.1
output <- gapCreation(X, rate)
plot(output$input_vector, type = "l", col = "red", lwd = 2)
lines(output$output_vector, lty = "dashed", lwd = 2)



