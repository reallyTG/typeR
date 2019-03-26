library(PBSmodelling)


### Name: plotCsum
### Title: Plot Cumulative Sum of Data
### Aliases: plotCsum
### Keywords: hplot

### ** Examples

local(envir=.PBSmodEnv,expr={
  oldpar = par(no.readonly=TRUE)
  x <- rgamma(n=1000,shape=2)
  plotCsum(x)
  par(oldpar)
})



