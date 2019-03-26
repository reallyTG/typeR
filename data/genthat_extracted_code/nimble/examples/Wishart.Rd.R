library(nimble)


### Name: Wishart
### Title: The Wishart Distribution
### Aliases: Wishart dwish_chol rwish_chol wishart

### ** Examples

df <- 40
ch <- chol(matrix(c(1, .7, .7, 1), 2))
x <- rwish_chol(1, ch, df = df)
dwish_chol(x, ch, df = df)




