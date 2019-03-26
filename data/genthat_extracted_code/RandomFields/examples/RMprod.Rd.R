library(RandomFields)


### Name: RMprod
### Title: Plain scalar product
### Aliases: RMprod
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


RFcov(RMprod(RMid()), as.matrix(1:10), as.matrix(1:10), grid=FALSE)


## C(x,y) =  exp(-||x|| + ||y||)
RFcov(RMprod(RMexp()), as.matrix(1:10), as.matrix(1:10), grid=FALSE)

## C(x,y) =  exp(-||x / 10|| + ||y / 10 ||)
model <- RMprod(RMexp(scale=10))
x <- seq(0,10,len=100)
z <- RFsimulate(model=model, x=x, y=x)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


