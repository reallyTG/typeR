library(HyperbolicDist)


### Name: SandP500
### Title: S&P 500
### Aliases: SandP500
### Keywords: datasets

### ** Examples

data(SandP500)
### Consider proportional changes in the index
change<-SandP500[-length(SandP500)]/SandP500[-1]
hist(change)
### Fit hyperbolic distribution to changes
hyperbFit(change)




