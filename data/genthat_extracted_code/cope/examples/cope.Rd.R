library(cope)


### Name: cope
### Title: Coverage Probability Excursion (CoPE) Sets
### Aliases: cope cope-package

### ** Examples

# An example using the ToySignal and the Toy Noise1 of this package.

# Set sample size.
n = 30  
# Generate n realizations of the toy noise field.
Data = ToyNoise1(n = n)
# Add the toy signal to the noise.
Data$z = Data$z + rep(ToySignal()$z, n)
# Compute the CoPE sets.
CopeSet = ComputeCope(Data,level=4/3, mu=ToySignal()$z)
# Plot the result.
PlotCope(CopeSet)




