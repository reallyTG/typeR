library(MRHawkes)


### Name: mllMRH1
### Title: Minus loglikelihood of an (bivariate) MRHawkes model with most
###   recent immigrant probabilities
### Aliases: mllMRH1
### Keywords: most recent immigrant probabilities likelihood

### ** Examples

## No test: 
  data <- cbind(sort(runif(1000,0,1000)), 
                sample(1:2, size = 1000, replace = TRUE))
  tmp <- mllMRH1(data = data, cens = 1001, 
                 par = c(3,1.2,1/3,0.2,1,1,0.5,0.2,0.2,0.3))
  ## last immigrant probabilities
  lip <- tmp$p
  ## sample last immigrant at censoring time for component one and 
  ## component two respectively
  c(sample(0:1000, 1, replace = TRUE, prob = rowSums(lip)), 
  sample(0:1000, 1, replace = TRUE, prob = colSums(lip)))
  
## End(No test)



