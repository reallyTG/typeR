library(RandomFields)


### Name: Independent Variables
### Title: Method to simulate the Nugget effect
### Aliases: RPnugget Nugget
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


x <- y <- 1:2
xy <- as.matrix(expand.grid(x, y)) ## we get 4 locations
## Standard use of the nugget effect
model <- RMnugget(var = 100)
RFcovmatrix(model, x=xy)
as.vector(RFsimulate(model, x=x, y=x, tol=1e-10))

## zonal nugget effect, which is not along the axes
model <- RMnugget(Aniso=matrix(1, nr=2, nc=2))
RFcovmatrix(model, x=xy)
as.vector(RFsimulate(model, x=x, y=x, tol=1e-10))


## All the following examples refer to repeated measurements
RFoptions(allow_duplicated_locations = TRUE) 
(xy <- rbind(xy, xy)) ## now, the 4 locations are repeated twice 

## standard situation: the nugget is interpreted as measurement error:
model <- RMnugget()
RFcovmatrix(model, x=xy)
as.matrix(RFsimulate(model, x=xy)) 

## any anisotropy matrix with full rank: spatial nugget effect
model <- RMnugget(Aniso=diag(2))
RFcovmatrix(model, x=xy)
as.matrix(RFsimulate(model, x=xy))

## anisotropy matrix with lower rank: zonal nugget effect
model <- RMnugget(Aniso=matrix(c(1, 0, 0, 0), nc=2))
RFcovmatrix(model, x=xy)
as.matrix(RFsimulate(model, x=xy))

## same as before: zonal nugget effect
model <- RMnugget(Aniso=t(c(1,0)))
RFcovmatrix(model, x=xy)
as.matrix(RFsimulate(model, x=xy))
## Don't show: 
FinalizeExample(); RFoptions(allow_duplicated_locations = FALSE) 
## End(Don't show)


