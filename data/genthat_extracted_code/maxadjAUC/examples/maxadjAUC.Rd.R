library(maxadjAUC)


### Name: maxadjAUC
### Title: Maximizing the Covariate-Adjusted AUC
### Aliases: maxadjAUC

### ** Examples

  ## Don't show: 
  expit <- function(x){
    exp(x)/(1+exp(x))
  }

  set.seed(1)

  covar <- rep(c(1:2),each=30)

  x1 <- rnorm(60,0,rep(runif(2,0.8,1.2),each=30))
  x2 <- rnorm(60,0,rep(runif(2,0.8,1.2),each=30))

  covint <- rep(runif(2,-1.5,1.5), each=30)

  y <- rbinom(60,1,expit(covint + 1*x1 - 1*x2))
  X <- cbind(x1,x2)

  output <- maxadjAUC(outcome=y, predictors=X, covariate=covar, initialval="rGLM",
                      approxh = 1/3, conditional=FALSE, tolval = 1e-2, stepsz = 1e-2)
  output
  
## End(Don't show)
  ## No test: 
  expit <- function(x){
    exp(x)/(1+exp(x))
  }

  set.seed(1)

  covar <- rep(c(1:4),each=100)

  x1 <- rnorm(400,0,rep(runif(4,0.8,1.2),each=100))
  x2 <- rnorm(400,0,rep(runif(4,0.8,1.2),each=100))
  x3 <- rnorm(400,0,rep(runif(4,0.8,1.2),each=100))
  x4 <- rnorm(400,0,rep(runif(4,0.8,1.2),each=100))

  covint <- rep(runif(4,-1.5,1.5), each=100)

  y <- rbinom(400,1,expit(covint + 1*x1 - 1*x2 + 1*x3 - 1*x4))
  X <- cbind(x1,x2,x3,x4)

  output <- maxadjAUC(outcome=y, predictors=X, covariate=covar, initialval="rGLM",
                      approxh = 1/3, conditional=FALSE, tolval = 1e-6, stepsz = 1e-5)
  output
  
## End(No test)



