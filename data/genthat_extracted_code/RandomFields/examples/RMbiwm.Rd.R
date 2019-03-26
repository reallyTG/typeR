library(RandomFields)


### Name: RMbiwm
### Title: Full Bivariate Whittle Matern Model
### Aliases: RMbiwm
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

x <- y <- seq(-10, 10, 0.2)
model <- RMbiwm(nudiag=c(0.3, 2), nured=1, rhored=1, cdiag=c(1, 1.5), 
                s=c(1, 1, 2))
plot(model)
plot(RFsimulate(model, x, y))

## Don't show: 
FinalizeExample()
## End(Don't show)


