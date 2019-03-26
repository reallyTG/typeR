library(sinib)


### Name: psinib
### Title: Distribution of Sum of Independent Non-Identical Binomial Random
###   Variables
### Aliases: psinib dsinib rsinib qsinib

### ** Examples

# Calculating the density and probability:
size <- as.integer(c(12, 14, 4, 2, 20, 17, 11, 1, 8, 11))
prob <- c(0.074, 0.039, 0.095, 0.039, 0.053, 0.043, 0.067, 0.018, 0.099, 0.045)
q <- x <- as.integer(seq(1, 19, 2))
dsinib(x, size, prob)
psinib(q, size, prob)

# Generating random samples:
rsinib(100, size, prob)

# Calculating quantiles:
p <- psinib(q, size, prob) 
qsinib(p, size, prob)




