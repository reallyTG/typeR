library(netchain)


### Name: chain.causal.multi
### Title: Causal estimation on collective outcomes under multiple
###   confounders and interference.
### Aliases: chain.causal.multi

### ** Examples

library(netchain)
set.seed(1234)
weight.matrix <- matrix(c(0.5, 1, 0, 1, 0.3, 0.5, 0, 0.5, -0.5), 3, 3)
simobs <- simGibbs(n.unit = 3, n.gibbs = 100, n.sample = 5, 
                  weight.matrix, treat.matrix = 0.5*diag(3), cov.matrix= (-0.3)*diag(3) )
inputY <- simobs$inputY                   
inputA <- simobs$inputA   
inputC <- simobs$inputC 
R.matrix <- ifelse(weight.matrix==0, 0, 1)    
diag(R.matrix) <- 0
edgeinfo <- list(rbind(c("Y", 1), c("C", 1)), rbind(c("Y", 2), c("C", 2)), 
           rbind(c("Y", 3), c("C", 3)))  
# implement a function (take > 10 seconds)
# result <- chain.causal.multi(targetoutcome = "mean",
# treatment <- c(1,0,0), inputY, inputA, listC = inputC, R.matrix, 
# E.matrix <- diag(3), edgeinfo = edgeinfo)





