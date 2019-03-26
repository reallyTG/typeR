library(coda)


### Name: mcmc.list
### Title: Replicated Markov Chain Monte Carlo Objects
### Aliases: mcmc.list as.mcmc.list as.mcmc.list.default is.mcmc.list
###   plot.mcmc.list
### Keywords: ts

### ** Examples

data(line)
x1 <- line[[1]]                    #Select first chain
x2 <- line[,1, drop=FALSE]         #Select first var from all chains
varnames(x2) == varnames(line)[1]  #TRUE



