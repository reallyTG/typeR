library(gustave)


### Name: sum_by
### Title: Efficient by-group (weighted) summation
### Aliases: sum_by

### ** Examples

# Data generation
set.seed(1)
n <- 100
p <- 10
H <- 3
y <- matrix(rnorm(n*p), ncol = p, dimnames = list(NULL, paste0("var", 1:10)))
y[1, 1] <- NA
by <- letters[sample.int(H, n, replace = TRUE)]
w <- rep(1, n)
w[by == "a"] <- 2

# Standard use
sum_by(y, by)

# Keeping the NAs
sum_by(y, by, na_rm = FALSE)

# With a weight
sum_by(y, by, w = w)




