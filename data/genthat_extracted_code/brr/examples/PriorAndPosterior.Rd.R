library(brr)


### Name: PriorAndPosterior
### Title: Prior and posterior distributions
### Aliases: PriorAndPosterior dpost dprior ppost pprior qpost qprior rpost
###   rprior spost sprior

### ** Examples

model <- Brr(a=2, b=4)
dprior(model, "mu", 1:3)
# the same:
dprior_mu(mu=1:3, a=2, b=4)
## Not run: 
##D dprior(model, "lambda", 1:3)
## End(Not run)
model <- model(c=4, d=5, S=10, T=10)
dprior(model, "lambda", 1:3)
model <- model(x=5, y=10)
ppost(model, "phi", 1)
model <- Brr()
## Not run: 
##D ppost(model, "phi", 1)
## End(Not run)
model <- model(x=5, y=10, S=3, T=10)
ppost(model, "phi", 1)



