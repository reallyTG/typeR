library(arm)


### Name: standardize
### Title: Function for Standardizing Regression Predictors by Centering
###   and Dividing by 2 sd's
### Aliases: standardize standardize,lm-method standardize,glm-method
###   standardize,merMod-method standardize,polr-method
### Keywords: manip models methods

### ** Examples

  # Set up the fake data
  n <- 100
  x <- rnorm (n, 2, 1)
  x1 <- rnorm (n)
  x1 <- (x1-mean(x1))/(2*sd(x1))   # standardization
  x2 <- rbinom (n, 1, .5)
  b0 <- 1
  b1 <- 1.5
  b2 <- 2
  y <- rbinom (n, 1, invlogit(b0+b1*x1+b2*x2))
  y2 <- sample(1:5, n, replace=TRUE)
  M1 <- glm (y ~ x, family=binomial(link="logit"))
  display(M1)
  M1.1 <- glm (y ~ rescale(x), family=binomial(link="logit"))
  display(M1.1)
  M1.2 <- standardize(M1)
  display(M1.2)
  # M1.1 & M1.2 should be the same
  M2 <- polr(ordered(y2) ~ x)
  display(M2)
  M2.1 <- polr(ordered(y2) ~ rescale(x))
  display(M2.1)
  M2.2 <- standardize(M2.1)
  display(M2.2)
  # M2.1 & M2.2 should be the same



