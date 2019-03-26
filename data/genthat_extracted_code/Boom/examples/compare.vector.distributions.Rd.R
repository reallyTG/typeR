library(Boom)


### Name: compare.vector.distribution
### Title: Boxplots to compare distributions of vectors
### Aliases: CompareVectorBoxplots compare.vector.boxplots

### ** Examples


x <- matrix(rnorm(300, mean = 1:3, sd = .4), ncol = 3, byrow = TRUE)
y <- matrix(rnorm(600, mean = 3:1, sd = .2), ncol = 3, byrow = TRUE)
CompareVectorBoxplots(list(x = x, y = y), colors = c("red", "blue"))




