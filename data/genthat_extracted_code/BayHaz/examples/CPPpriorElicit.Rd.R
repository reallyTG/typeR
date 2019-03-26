library(BayHaz)


### Name: CPPpriorElicit
### Title: Function to Set Hyperparameters of CPP Priors
### Aliases: CPPpriorElicit
### Keywords: distribution survival smooth

### ** Examples

# ten events per century with unit coefficient of variation
# fifty year time horizon with a couple of extremes in a "typical" trajectory
hypars<-CPPpriorElicit(r0 = 0.1, H = 1, T00 = 50, M00 = 2)



