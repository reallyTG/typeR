library(PrevMap)


### Name: Laplace.sampling
### Title: Langevin-Hastings MCMC for conditional simulation
### Aliases: Laplace.sampling

### ** Examples

set.seed(1234)
data(data_sim)
n.subset <- 50
data_subset <- data_sim[sample(1:nrow(data_sim),n.subset),]
mu <- rep(0,50)
Sigma <- varcov.spatial(coords=data_subset[,c("x1","x2")],
              cov.pars=c(1,0.15),kappa=2)$varcov
control.mcmc <- control.mcmc.MCML(n.sim=1000,burnin=0,thin=1,
                           h=1.65/(n.subset^2/3))
invisible(Laplace.sampling(mu=mu,Sigma=Sigma,
                                       y=data_subset$y,units.m=data_subset$units.m,
                                       control.mcmc=control.mcmc))



