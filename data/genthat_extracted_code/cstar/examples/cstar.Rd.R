library(cstar)


### Name: cstar
### Title: Compute cstar from least squares results
### Aliases: cstar
### Keywords: sustantive significance regression

### ** Examples

# generate synthetic OLS data
x <- rnorm(50)
error <- rnorm(50)
y <- 1 + 1.5*x + error

# estimate model
OLSmodel <- lm(y~x)

# obtain expected utility of acting on validity of beta,
# conditional on a loss-aversion factor of 2
cstar(OLSmodel, 2)

# examine the sensitivity to choice of loss-aversion factor
loss_aversion_values <- c(1, 2, 3, 4)
eu <- NULL
for(i in loss_aversion_values){
  eu <- c(eu, cstar(OLSmodel, i)[2])
  }
plot(loss_aversion_values, eu)





