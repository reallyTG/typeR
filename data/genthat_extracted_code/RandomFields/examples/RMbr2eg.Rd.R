library(RandomFields)


### Name: RMbr2eg
### Title: Transformation from Brown-Resnick to Gauss
### Aliases: RMbr2eg
### Keywords: spatial

### ** Examples
## Don't show: 
StartExample(reduced=20)
## End(Don't show)
RFoptions(seed=0) ## *ANY* simulation will have the random seed 0; set
##                   RFoptions(seed=NA) to make them all random again

model <- RMexp(var=1.62 / 2) 
binary.model <- RPbernoulli(RMbr2bg(model))
x <- seq(0, 10, 0.05)

z <- RFsimulate(RPschlather(binary.model), x, x)
plot(z)

## Don't show: 
FinalizeExample()
## End(Don't show)


