library(bayesQR)


### Name: predict.bayesQR
### Title: Calculate predicted probabilities for binary quantile regression
### Aliases: predict.bayesQR

### ** Examples

# Simulate data from binary regression model
set.seed(1234)
n <- 200
X <- matrix(runif(n=n*2, min=-5, max=5),ncol=2)
ystar <- cbind(1,X)%*% c(1,1.5,-.5) + rnorm(n=n, mean=0, sd=abs(2*X[,1]))
y <- as.numeric(ystar>0)

# Estimate a sequence of binary quantile regression models
# NOTE: to limit execution time of the example, ndraw is set
#       to a very low value. Set value to 4000 for a better
#       approximation of the posterior distirubtion.
out <- bayesQR(y ~ X, quantile=seq(.1,.9,.1), ndraw=400)

# Calculate predicted probabilities
pred <- predict(object=out, X=cbind(1,X), burnin=20)

# Make histogram of predicted probabilities 
hist(pred,breaks=10)

# Calculate Percentage Correclty Classified (PCC)
mean(y==as.numeric(pred>.5))

# Compare with logit model
mylogit <- glm(y ~ X, family=binomial(logit))

# Make histogram of predicted probabilities 
hist(mylogit$fit,breaks=10)

# Calculate Percentage Correclty Classified (PCC)
mean(y==as.numeric(mylogit$fit>.5))



