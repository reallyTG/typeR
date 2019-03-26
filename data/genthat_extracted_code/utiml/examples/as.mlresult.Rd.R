library(utiml)


### Name: as.mlresult
### Title: Convert a matrix prediction in a multi label prediction
### Aliases: as.mlresult as.mlresult.default as.mlresult.mlresult

### ** Examples

predictions <- matrix(runif(100), ncol = 10)
colnames(predictions) <- paste('label', 1:10, sep='')

# Create a mlresult from a matrix
mlresult <- as.mlresult(predictions)
mlresult <- as.mlresult(predictions, probability = FALSE)
mlresult <- as.mlresult(predictions, probability = FALSE, threshold = 0.6)

# Change the current type of a mlresult
mlresult <- as.mlresult(mlresult, probability = TRUE)



