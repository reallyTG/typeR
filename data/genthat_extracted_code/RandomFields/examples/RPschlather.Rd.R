library(RandomFields)


### Name: ExtremalGaussian
### Title: Extremal Gaussian process
### Aliases: RPschlather 'extremal Gaussian' 'extremal Gaussian process'
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0, xi=0)
## seed=0: *ANY* simulation will have the random seed 0; set
##         RFoptions(seed=NA) to make them all random again

## xi=0: any simulated max-stable random field has extreme value index 0
x <- seq(0, 2,0.01)

## standard use of RPschlather (i.e. a standardized Gaussian field)
model <- RMgauss()
z1 <- RFsimulate(RPschlather(model), x)
plot(z1, type="l")

## the following refers to the generalized use of RPschlather, where
## any random field can be used. Note that 'z1' and 'z2' have the same
## margins and the same .Random.seed (and the same simulation method),
## hence the same values
model <- RPgauss(RMgauss(var=2))
z2 <- RFsimulate(RPschlather(model), x)
plot(z2, type="l")
all.equal(z1, z2) # true

## Note that the following definition is incorrect
try(RFsimulate(model=RPschlather(RMgauss(var=2)), x=x))


## check whether the marginal distribution (Gumbel) is indeed correct:
model <- RMgauss()
z <- RFsimulate(RPschlather(model, xi=0), x, n=100)
plot(z)
hist(unlist(z@data), 50, freq=FALSE)
curve(exp(-x) * exp(-exp(-x)), from=-3, to=8, add=TRUE) 


## Don't show: 
FinalizeExample()
## End(Don't show)


