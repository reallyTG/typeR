library(nimble)


### Name: Inverse-Wishart
### Title: The Inverse Wishart Distribution
### Aliases: Inverse-Wishart dinvwish_chol inverse-wishart rinvwish_chol

### ** Examples

df <- 40
ch <- chol(matrix(c(1, .7, .7, 1), 2))
x <- rwish_chol(1, ch, df = df)
dwish_chol(x, ch, df = df)




