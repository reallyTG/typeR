library(gamboostLSS)


### Name: gamboostLSS-package
### Title: Boosting algorithms for GAMLSS
### Aliases: gamboostLSS-package
### Keywords: package

### ** Examples

# Generate covariates
x1 <- runif(100)
x2 <- runif(100)
eta_mu <-     2 - 2*x1
eta_sigma <-  -1  + 2*x2

# Generate response: Negative Binomial Distribution
y <- numeric(100)
for( i in 1:100)  y[i] <- rnbinom(1, size=exp(eta_sigma[i]), mu=exp(eta_mu[i]))

# Model fitting, 300 boosting steps, same formula for both distribution parameters
mod1 <- glmboostLSS( y ~ x1 + x2, families=NBinomialLSS(),
        control=boost_control(mstop=300), center = TRUE)

# Shrinked effect estimates
coef(mod1, off2int=TRUE)

# Empirical risk with respect to mu
plot(risk(mod1)$mu)

# Empirical risk with respect to sigma
plot(risk(mod1)$sigma)



