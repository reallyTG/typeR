library(RandomFields)


### Name: Circulant Embedding
### Title: Circulant Embedding methods
### Aliases: Circulant RPcirculant Cutoff RPcutoff Intrinsic RPintrinsic
### Keywords: methods

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMstable(s=1, alpha=1.8)
x <- seq(-3,3,0.1)
## Don't show: 
if (!interactive()){print("x values changed"); x <- -1:1}
## End(Don't show)
z <- RFsimulate(model=RPcirculant(model), x=x, y=x, n=1)
plot(z)

model <- RMexp(var=10, s=2)
z <- RFsimulate(model=RPcirculant(model), 1:10)
plot(z)

model <- RMfbm(Aniso=diag(c(1,2)), alpha=1.5)
z <- RFsimulate(model, x=1:10, y=1:10)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


