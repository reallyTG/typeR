library(ratematrix)


### Name: extractCorrelation
### Title: Extract the posterior distribution of evolutionary correlation
### Aliases: extractCorrelation

### ** Examples

## No test: 
data( centrarchidae )
dt.range <- t( apply( centrarchidae$data, 2, range ) )
## The step size for the root value can be set given the range we need to sample from:
w_mu <- ( dt.range[,2] - dt.range[,1] ) / 10
par.sd <- cbind(c(0,0), sqrt( c(10,10) ))
prior <- makePrior(r=2, p=2, den.mu="unif", par.mu=dt.range, den.sd="unif", par.sd=par.sd)
handle <- ratematrixMCMC(data=centrarchidae$data, phy=centrarchidae$phy.map, prior=prior
                         , gen=10000, w_mu=w_mu, dir=tempdir())
posterior <- readMCMC(handle, burn = 0.2, thin = 10)
## Get the correlations:
cor.list <- extractCorrelation(post = posterior)
## Plot the results:
boxplot(cor.list[[1]], main = "Regime 1") ## Regime 1
boxplot(cor.list[[2]], main = "Regime 2") ## Regime 2
## End(No test)



