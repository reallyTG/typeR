library(permGS)


### Name: exactLR
### Title: exactLR
### Aliases: exactLR

### ** Examples

T <- rexp(20)
C <- rexp(20)
data <- data.frame(time=pmin(T, C), status=(T<=C), trt=rbinom(20, 1, 0.5))

# Approximate permutation test using 1000 random permutations
x <- exactLR(1000, Surv(time, status) ~ trt, data, "approximate")

print(paste("Approximate permutation p-value:", x$p))

# Exact permutation test
y <- exactLR(0, Surv(time, status) ~ trt, data, "exact")
print(paste("Exact permutation p-value:", y$p))




