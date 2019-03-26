library(PROreg)


### Name: print.BBreg
### Title: Print a BBreg class model.
### Aliases: print.BBreg

### ** Examples

# We simulate a covariate, fix the paramters of the beta-binomial 
# distribution and simulate a response variable.

# Then we apply the model, and try to get the same values.
set.seed(18)
k <- 1000
m <- 10
x <- rnorm(k,5,3)

beta <- c(-10,2)
p <- 1/(1+exp(-(beta[1]+beta[2]*x)))
phi <- 1.2

y <- rBB(k,m,p,phi)

model <- BBreg(y~x,m)
print(model) # or just model



