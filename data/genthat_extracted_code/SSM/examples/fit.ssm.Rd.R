library(SSM)


### Name: fit.ssm
### Title: Fit a smooth supersaturated model
### Aliases: fit.ssm

### ** Examples

# A simple one factor example
X <- seq(-1,1,0.5) # design
Y <- c(0,1,0,0.5,0) # response
s <- fit.ssm(X,Y)
s
plot(s)
predict(s,0.3)

# used defined basis sizes

# A model that is too large to fit
## Not run: 
##D s <- fit.ssm(X, Y, basis_size=80)
## End(Not run)
# A large model that can be fit but is unstable
s <- fit.ssm(X, Y, basis_size=70)
plot(s)
# A model larger than default that is not unstable
s <- fit.ssm(X, Y, basis_size=40)
plot(s)

# with metamodel error estimate

s <- fit.ssm(X, Y, GP=TRUE)
plot(s)
predict(s,0.3)

# Sensitivity analysis and main effect plotting

# A design of 20 points over [-1, 1]^d
X <- matrix(runif(20, -1, 1), ncol = 2)
Y <- runif(10)
s <- fit.ssm(X, Y, SA = TRUE)
s
sensitivity.plot(s)
plot(s)



