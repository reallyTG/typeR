library(ICtest)


### Name: ggplot.ictest
### Title: Scatterplot Matrix for a ictest Object using ggplot2
### Aliases: ggplot.ictest
### Keywords: hplot

### ** Examples

# The data
X <- iris[, 1:4]

# The aesthetics variables
mapvar <- data.frame(iris[, 5])
colnames(mapvar) <- "species"

TestCov <- PCAasymp(X, k = 2)
ggplot(TestCov)
ggplot(TestCov, aes(color = species), mapvar = mapvar, which = "k")



