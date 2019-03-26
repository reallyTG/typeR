library(Ohit)


### Name: OGA
### Title: Orthogonal greedy algorithm
### Aliases: OGA

### ** Examples

# Example setup (Example 3 in Section 5 of Ing and Lai (2011))
n = 400
p = 4000
q = 10
beta_1q = c(3, 3.75, 4.5, 5.25, 6, 6.75, 7.5, 8.25, 9, 9.75)
b = sqrt(3/(4 * q))

x_relevant = matrix(rnorm(n * q), n, q)
d = matrix(rnorm(n * (p - q), 0, 0.5), n, p - q)
x_relevant_sum = apply(x_relevant, 1, sum)
x_irrelevant = apply(d, 2, function(a) a + b * x_relevant_sum)
X = cbind(x_relevant, x_irrelevant)
epsilon = rnorm(n)
y = as.vector((x_relevant %*% beta_1q) + epsilon)

# Select valuables via OGA
OGA(X, y)



