library(ppsbm)


### Name: generatePP
### Title: Poisson process
### Aliases: generatePP

### ** Examples

# Generate a Poisson Process with intensity function
# intens= function(x) 100*x*exp(-8*x)
# and max.intens = 5

intens <- function(x) 100*x*exp(-8*x)

poissonProcess <- generatePP(intens, Time=30, max.intens=1)




