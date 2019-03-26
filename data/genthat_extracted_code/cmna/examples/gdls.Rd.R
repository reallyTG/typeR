library(cmna)


### Name: gdls
### Title: Least squares with graident descent
### Aliases: gdls

### ** Examples

head(b <- iris$Sepal.Length)
head(A <- matrix(cbind(1, iris$Sepal.Width, iris$Petal.Length, iris$Petal.Width), ncol = 4))
gdls(A, b, alpha = 0.05, m = 10000)




