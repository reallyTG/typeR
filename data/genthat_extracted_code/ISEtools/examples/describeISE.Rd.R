library(ISEtools)


### Name: describeISE
### Title: Ion selective electrode characterisation
### Aliases: describeISE

### ** Examples

# Fast-running example with only 100 MCMC iterations for testing:
data(carbonate)
example3test = describeISE(carbonate, Z = -2, SN = 3.6, 
 burnin=100, iters=200, chains=1, 
 a.init= c(-50,180,140,65,100,170,100,130), 
 b.init=rep(-20,8), cstar.init=rep(0.2, 8), program="jags")
print(example3test)
summary(example3test)
plot(example3test)
## No test: 
# Full example with 100,000 iterations (25,000 by 4 chains):
data(carbonate)
example3 = describeISE(carbonate, Z = -2, SN = 3.6)
print(example3)
summary(example3)
plot(example3)
## End(No test)



