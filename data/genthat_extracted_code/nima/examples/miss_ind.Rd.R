library(nima)


### Name: miss_ind
### Title: Add missingness indicators to existing data object
### Aliases: miss_ind

### ** Examples

data <- data.frame(cbind(rnorm(10), runif(10)))
data[sample(nrow(data), 3), 1] <- NA
data[sample(nrow(data), 4), 2] <- NA
data <- miss_ind(data)



