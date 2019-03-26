library(b6e6rl)


### Name: b6e6rl
### Title: Adaptive differential evolution, b6e6rl algorithm
### Aliases: b6e6rl
### Keywords: b6e6rl adaptive differential evolution

### ** Examples

##Example of the b6e6rl call

fn_name <- ("f_dejong")
a <- c(-30,-30,-30)
b <- c(30,30,30)
N <- 60
max_evals <- 20000
my_eps <- 0.000001
n0 <- 2
delta <- 1/(5*12)

b6e6rl(fn_name, a, b, N, my_eps, max_evals, n0, delta)





