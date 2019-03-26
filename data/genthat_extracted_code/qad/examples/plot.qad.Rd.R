library(qad)


### Name: plot.qad
### Title: Plot conditional probabilites
### Aliases: plot.qad

### ** Examples

## Example 1
n <- 1000
x <- runif(n, 0, 1)
y <- runif(n, 0, 1)
sample <- data.frame(x, y)

#qad (Not Run)
# mod <- qad(sample)
# plot(mod, addSample = TRUE, copula = FALSE)

## Example 2
n <- 1000
x <- runif(n, -1, 1)
y <- x^2 + rnorm(n, 0, 0.1)
sample <- data.frame(x, y)

#qad (Not Run)
# mod <- qad(sample)
# plot(mod, addSample = TRUE, copula = TRUE)
# plot(mod, addSample = TRUE, copula = FALSE)




