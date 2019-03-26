library(RandomFields)


### Name: RMbr2bg
### Title: Transformation from Brown-Resnick to Bernoulli
### Aliases: RMbr2bg
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample()
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp(var=1.62 / 2) 
x <- seq(0, 10, 0.05)
z <- RFsimulate(RPschlather(RMbr2eg(model)), x, x)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


