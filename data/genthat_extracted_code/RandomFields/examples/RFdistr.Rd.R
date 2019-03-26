library(RandomFields)


### Name: RFdistr
### Title: Evaluating distribution families
### Aliases: RFdistr RFddistr RFpdistr RFqdistr RFrdistr
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

## a very toy example to understand the use
model <- RRdistr(norm())
v <- 0.5
Print(RFdistr(model=model, x=v), dnorm(x=v)) 
Print(RFdistr(model=model, q=v), pnorm(q=v))
Print(RFdistr(model=model, p=v), qnorm(p=v))

n <- 10
r <- RFdistr(model=model, n=n, seed=0)
set.seed(0); Print(r, rnorm(n=n))


## note that a conditional covariance function given the
## random parameters is given here:
model <- RMgauss(scale=exp())
for (i in 1:3) {
  RFoptions(seed = i + 10)
  readline(paste("Model no.", i, ": press return", sep=""))
  plot(model)
  readline(paste("Simulation no.", i, ": press return", sep=""))  
  plot(RFsimulate(model, x=seq(0,10,0.1)))
}
## Don't show: 
FinalizeExample()
## End(Don't show)


