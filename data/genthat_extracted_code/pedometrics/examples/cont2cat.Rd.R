library(pedometrics)


### Name: cont2cat
### Title: Stratification and categorization of continuous data
### Aliases: breakPoints cont2cat stratify

### ** Examples


## Compute the break points of marginal strata
x <- data.frame(x = round(rnorm(10), 1), y = round(rlnorm(10), 1))
x <- breakPoints(x = x, n = 4, type = "area", prop = TRUE)
x

## Convert continuous data into categorical data
# Matrix
x <- y <- c(1:10)
x <- cbind(x, y)
breaks <- list(c(1, 2, 4, 8, 10), c(1, 5, 10))
y <- cont2cat(x, breaks)
y
# Data frame
x <- y <- c(1:10)
x <- data.frame(x, y)
breaks <- list(c(1, 2, 4, 8, 10), c(1, 5, 10))
y <- cont2cat(x, breaks, integer = TRUE)
y
# Vector
x <- c(1:10)
breaks <- c(1, 2, 4, 8, 10)
y <- cont2cat(x, breaks, integer = TRUE)
y

## Stratification
x <- data.frame(x = round(rlnorm(10), 1), y = round(rnorm(10), 1))
x <- stratify(x = x, n = 4, type = "area", integer = TRUE)
x



