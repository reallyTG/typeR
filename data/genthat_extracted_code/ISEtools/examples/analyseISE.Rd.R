library(ISEtools)


### Name: analyseISE
### Title: Ion selective electrode characterisation and estimation of
###   sample concentrations
### Aliases: analyseISE

### ** Examples

# Fast-running example with only 100 MCMC iterations for testing:
data(LeadStdAdd)
example2test = analyseISE(LeadStdAdd, Z = 2, temperature = 21, 
  burnin=100, iters=200, chains=1, a.init=c(176, 146, -112), 
  b.init=c(29, 30, 31), cstar.init=c(0.26, 0.27, 0.22), program="jags")
print(example2test)
summary(example2test)
plot(example2test, ylim = c(-7, -3), xlab = "ID (Sample)", 
     ylab = expression(paste(log[10], " ", Pb^{paste("2","+",sep="")} )))
## No test: 
# Full example with 100,000 iterations (25,000 by 4 chains):
data(LeadStdAdd)
example2 = analyseISE(LeadStdAdd, Z = 2, temperature = 21)
print(example2)
summary(example2)
plot(example2, ylim = c(-7, -3), xlab = "ID (Sample)", 
	ylab = expression(paste(log[10], " ", Pb^{paste("2","+",sep="")} )))
## End(No test)



