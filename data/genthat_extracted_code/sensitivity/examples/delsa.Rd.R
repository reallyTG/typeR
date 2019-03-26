library(sensitivity)


### Name: delsa
### Title: Distributed Evaluation of Local Sensitivity Analysis
### Aliases: delsa tell.delsa print.delsa plot.delsa
### Keywords: design

### ** Examples

# Test case : the non-monotonic Sobol g-function
# (there are 8 factors, all following the uniform distribution on [0,1])

## No test: 
library(randtoolbox)
x <- delsa(model=sobol.fun,
           par.ranges=replicate(8,c(0,1),simplify=FALSE),
           samples=100,method="sobol")

# Summary of sensitivity indices of each parameter across parameter space
print(x)

library(ggplot2)
library(reshape2)
x11()
plot(x)
## End(No test)



