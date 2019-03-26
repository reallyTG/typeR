library(cope)


### Name: ComputeCope
### Title: Compute CoPE sets.
### Aliases: ComputeCope

### ** Examples

# An example using the ToyNoise and ToySignal of this package.
## Not run: 
##D n = 30
##D Data = ToyNoise1(n = n)
##D Data$z = Data$z + rep(ToySignal()$z, n)
##D CopeSet = ComputeCope(Data,level=4/3, mu=ToySignal()$z)
##D PlotCope(CopeSet)
## End(Not run)



