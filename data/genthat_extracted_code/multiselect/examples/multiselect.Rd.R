library(multiselect)


### Name: multiselect
### Title: Selecting Combinations of Predictors by Leveraging Multiple AUCs
###   for an Ordered Multilevel Outcome
### Aliases: multiselect

### ** Examples

  ## Don't show: 
  library(MASS)
  ## shorter example not for users

  set.seed(15)
  p = 4 ## number of predictors
  matX <- matrix(rep(0.3,p*p), nrow=p, ncol=p) ## covariance matrix for the predictors
  diag(matX) <- rep(1,p)

  simD <- apply(rmultinom(400, 1, c(0.6,0.335,0.065)),2,which.max)
  simDord <- simD[order(simD)]
  numobs <- table(simDord)

  simX1 <- mvrnorm(numobs[1], rep(0,p), 2*matX)
  simX2 <- mvrnorm(numobs[2], c(1.5, 1, rep(0.5,(p-2)/2), rep(0.1,(p-2)/2)), 2*matX)
  simX3 <- mvrnorm(numobs[3], c(rep(2,2), rep(0.8,(p-2)/2), rep(0.1,(p-2)/2)), 2*matX)
  simX <- rbind(simX1, simX2, simX3)

  exdata <- data.frame("D"=simDord, simX)

  multiselect(data=exdata, size=2, Breps=2, nummod=3)
  
## End(Don't show)
  ## No test: 
  library(MASS)
  ## example takes ~1 minute to run

  set.seed(15)
  p = 16 ## number of predictors
  matX <- matrix(rep(0.3,p*p), nrow=p, ncol=p) ## covariance matrix for the predictors
  diag(matX) <- rep(1,p)

  simD <- apply(rmultinom(400, 1, c(0.6,0.335,0.065)),2,which.max)
  simDord <- simD[order(simD)]
  numobs <- table(simDord)

  simX1 <- mvrnorm(numobs[1], rep(0,p), 2*matX)
  simX2 <- mvrnorm(numobs[2], c(1.5, 1, rep(0.5,(p-2)/2), rep(0.1,(p-2)/2)), 2*matX)
  simX3 <- mvrnorm(numobs[3], c(rep(2,2), rep(0.8,(p-2)/2), rep(0.1,(p-2)/2)), 2*matX)
  simX <- rbind(simX1, simX2, simX3)

  exdata <- data.frame("D"=simDord, simX)

  multiselect(data=exdata, size=2, Breps=20, nummod=10)
  
## End(No test)



