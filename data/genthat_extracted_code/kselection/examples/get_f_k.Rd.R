library(kselection)


### Name: get_f_k
### Title: Get the f(K) vector
### Aliases: get_f_k

### ** Examples

# Create a data set with two clusters
dat <- matrix(c(rnorm(100, 2, .1), rnorm(100, 3, .1),
                rnorm(100, -2, .1), rnorm(100, -3, .1)), 200, 2)

# Get the f(k) vector
sol <- kselection(dat)
f_k <- get_f_k(sol)



