library(l0ara)


### Name: l0ara
### Title: fit a generalized linear model with l0 penalty
### Aliases: l0ara

### ** Examples

# Linear regression
# Generate design matrix and response variable
n <- 100
p <- 40
x <- matrix(rnorm(n*p), n, p)
beta <- c(1,0,2,3,rep(0,p-4))
noise <- rnorm(n)
y <- x%*%beta+noise
# fit sparse linear regression using BIC 
res.gaussian <- l0ara(x, y, family="gaussian", log(n))

# predict for new observations
print(res.gaussian)
predict(res.gaussian, newx=matrix(rnorm(3,p),3,p))
coef(res.gaussian)

# Logistic regression
# Generate design matrix and response variable
n <- 100
p <- 40
x <- matrix(rnorm(n*p), n, p)
beta <- c(1,0,2,3,rep(0,p-4))
prob <- exp(x%*%beta)/(1+exp(x%*%beta))
y <- rbinom(n, rep(1,n), prob)
# fit sparse logistic regression
res.logit <- l0ara(x, y, family="logit", 0.7)

# predict for new observations
print(res.logit)
predict(res.logit, newx=matrix(rnorm(3,p),3,p))
coef(res.logit)

# Poisson regression
# Generate design matrix and response variable
n <- 100
p <- 40
x <- matrix(rnorm(n*p), n, p)
beta <- c(1,0,0.5,0.3,rep(0,p-4))
mu <- exp(x%*%beta)
y <- rpois(n, mu)
# fit sparse Poisson regression using AIC
res.pois <- l0ara(x, y, family="poisson", 2)

# predict for new observations
print(res.pois)
predict(res.pois, newx=matrix(rnorm(3,p),3,p))
coef(res.pois)



