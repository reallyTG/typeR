library(markovchain)


### Name: fitHighOrderMultivarMC
### Title: Function to fit Higher Order Multivariate Markov chain
### Aliases: fitHighOrderMultivarMC

### ** Examples

data <- matrix(c('2', '1', '3', '3', '4', '3', '2', '1', '3', '3', '2', '1', 
               c('2', '4', '4', '4', '4', '2', '3', '3', '1', '4', '3', '3')), 
               ncol = 2, byrow = FALSE)
               
fitHighOrderMultivarMC(data, order = 2, Norm = 2)                




