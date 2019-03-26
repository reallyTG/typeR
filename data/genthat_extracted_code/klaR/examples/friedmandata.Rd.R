library(klaR)


### Name: friedman.data
### Title: Friedman's classification benchmark data
### Aliases: friedman.data
### Keywords: multivariate

### ** Examples

# Reproduce the 1st setting with 6 variables.
# Error rate should be somewhat near 9 percent.
training <- friedman.data(1, 6, 40)
x <- rda(class ~ ., data = training, gamma = 0.74, lambda = 0.77)
test <- friedman.data(1, 6, 100)
y <- predict(x, test[,-1])
errormatrix(test[,1], y$class)



