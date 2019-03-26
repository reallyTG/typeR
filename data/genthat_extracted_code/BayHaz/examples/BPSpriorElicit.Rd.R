library(BayHaz)


### Name: BPSpriorElicit
### Title: Function to Set Hyperparameters of BPS Priors
### Aliases: BPSpriorElicit
### Keywords: distribution survival smooth

### ** Examples

# ten events per century with unit coefficient of variation and fifty year time horizon
# cubic splines with minimal number of knots and strongly correlated spline weights
hypars<-BPSpriorElicit(r0 = 0.1, H = 1, T00 = 50, ord = 4, G = 3, c = 0.9)



