library(RandomFields)


### Name: RFpseudovariogram
### Title: Pseudovariogram
### Aliases: RFpseudovariogram
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again


model <- RMbiwm(nudiag=c(1, 2), nured=1, rhored=1, cdiag=c(1, 5), 
                s=c(1, 1, 2))
x <- seq(0, 20, 0.1)
z <- RFsimulate(model, x=x, y=x, n=2)
emp.vario <- RFpseudovariogram(data=z)
plot(emp.vario, model=model)

## Don't show: 
FinalizeExample()
## End(Don't show)


