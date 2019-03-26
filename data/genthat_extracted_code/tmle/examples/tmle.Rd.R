library(tmle)


### Name: tmle
### Title: Targeted Maximum Likelihood Estimation
### Aliases: tmle

### ** Examples

library(tmle)
  set.seed(1)
  n <- 250
  W <- matrix(rnorm(n*3), ncol=3)
  A <- rbinom(n,1, 1/(1+exp(-(.2*W[,1] - .1*W[,2] + .4*W[,3]))))
  Y <- A + 2*W[,1] + W[,3] + W[,2]^2 + rnorm(n)

# Example 1. Simplest function invocation 
# SuperLearner called to estimate Q, g
# Delta defaults to 1 for all observations   
  result1 <- tmle(Y,A,W)
  summary(result1)

# Example 2: 
# User-supplied regression formulas to estimate Q and g
# binary outcome
 # n <- 250
  W <- matrix(rnorm(n*3), ncol=3)
  colnames(W) <- paste("W",1:3, sep="")
  A <- rbinom(n,1, plogis(0.6*W[,1] +0.4*W[,2] + 0.5*W[,3]))
  Y <- rbinom(n,1, plogis(A + 0.2*W[,1] + 0.1*W[,2] + 0.2*W[,3]^2 ))
  result2 <- tmle(Y,A,W, family="binomial", Qform=Y~A+W1+W2+W3, gform=A~W1+W2+W3)
  summary(result2)

# Example 3: Population mean outcome
# User-supplied (misspecified) model for Q, 
# Super learner called to estimate g, g.Delta
# approx. 20% missing at random
  Y <- W[,1] + W[,2]^2 + rnorm(n)
  Delta <- rbinom(n, 1, 1/(1+exp(-(1.7-1*W[,1]))))
  result3 <- tmle(Y,A=NULL,W, Delta=Delta, Qform="Y~A+W1+W2+W3")
  print(result3)

# Example 4: Controlled direct effect
# User-supplied models for g, g.Z
  A <- rbinom(n,1,.5)
  Z <- rbinom(n, 1, plogis(.5*A + .1*W[,1]))
  Y <- 1 + A + 10*Z + W[,1]+ rnorm(n)
  
  CDE <- tmle(Y,A,W, Z, gform="A~1", g.Zform = "Z ~ A + W1")
  total.effect <- tmle(Y,A, W,  gform="A~1")
  print(CDE)
  print(total.effect)



