library(RandomFields)


### Name: RFpseudomadogram
### Title: Empirical Pseudomadogram
### Aliases: RFpseudomadogram
### Keywords: spatial models

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again
model <- RMbiwm(nudiag=c(1, 2), nured=1, rhored=1, cdiag=c(1, 5), 
                s=c(1, 1, 2))
n <- 2
x <- seq(0, 20, 0.1)
z <- RFsimulate(model, x=x, y=x, n=n)
emp.vario <- RFpseudomadogram(data=z)
plot(emp.vario)

## Don't show: 
FinalizeExample()
## End(Don't show)


