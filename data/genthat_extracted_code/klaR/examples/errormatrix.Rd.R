library(klaR)


### Name: errormatrix
### Title: Tabulation of prediction errors by classes
### Aliases: errormatrix
### Keywords: multivariate

### ** Examples

data(iris)
library(MASS)
x <- lda(Species ~ Sepal.Length + Sepal.Width, data=iris)
y <- predict(x, iris)

# absolute numbers: 
errormatrix(iris$Species, y$class)

# relative frequencies: 
errormatrix(iris$Species, y$class, relative = TRUE)

# percentages: 
round(100 * errormatrix(iris$Species, y$class, relative = TRUE), 0)

# expected error rate in case of class prior: 
indiv.rates <- errormatrix(iris$Species, y$class, relative = TRUE)[1:3, 4]
prior <- c("setosa" = 0.2, "versicolor" = 0.3, "virginica" = 0.5)
total.rate <- t(indiv.rates) %*% prior
total.rate



