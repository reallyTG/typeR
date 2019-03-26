library(safeBinaryRegression)


### Name: glm
### Title: Fitting Generalized Linear Models
### Aliases: glm
### Keywords: regression

### ** Examples

## A set of 4 completely separated sample points ##
x <- c(-2, -1, 1, 2)
y <- c(0, 0, 1, 1)

## Not run: glm(y ~ x, family = binomial)


## A set of 4 quasicompletely separated sample points ##
x <- c(-2, 0, 0, 2)
y <- c(0, 0, 1, 1)

## Not run: glm(y ~ x, family = binomial)



