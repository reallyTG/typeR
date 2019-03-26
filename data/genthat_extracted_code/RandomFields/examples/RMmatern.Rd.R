library(RandomFields)


### Name: RMwhittlematern
### Title: Whittle-Matern Covariance Model
### Aliases: RMwhittle RMkbessel RMmatern RMhandcock Sobolev whittle-matern
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- seq(0, 1, len=100)
model <- RMwhittle(nu=1, Aniso=matrix(nc=2, c(1.5, 3, -3, 4)))
plot(model, dim=2, xlim=c(-1,1))
z <- RFsimulate(model=model, x, x)
plot(z)
## Don't show: 
FinalizeExample()
## End(Don't show)


