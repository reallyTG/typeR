library(HAC)


### Name: dHAC, pHAC, rHAC
### Title: pdf, cdf and random sampling
### Aliases: dHAC pHAC rHAC

### ** Examples

# AC example
# define the underlying model
model = hac(type = 4, tree = list("X1", "X2", 2))

# sample from model
sample = rHAC(100, model)

# returns the pdf/cdf at each vector of the sample
d.values = dHAC(sample, model)
p.values = pHAC(sample, model)

# HAC example
# the underlying model
y = c("X1", "X2", "X3")
theta = c(1.5, 3)
model = hac.full(type = 1, y, theta)

# define sample from copula model
sample = rHAC(100, model)

# returns the pdf/cdf at each point of the sample
d.values = dHAC(sample, model)
p.values = pHAC(sample, model)

# construct a hac-model
tree = list(list("X1", "X5", 3), list("X2", "X3", "X4", 4), 2)
model = hac(type = 1, tree = tree)

# sample from copula model
sample = rHAC(1000, model)

# check the accurancy of the estimation procedure
result1 = estimate.copula(sample)
result2 = estimate.copula(sample, epsilon = 0.2)



