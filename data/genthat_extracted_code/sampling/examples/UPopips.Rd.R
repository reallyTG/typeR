library(sampling)


### Name: UPopips
### Title: Order pips sampling
### Aliases: UPopips
### Keywords: survey

### ** Examples

#define the working inclusion probabilities
lambda=c(0.2,0.7,0.8,0.5,0.4,0.4)
#draw a Pareto sample
s=UPopips(lambda, type="pareto")
#the sample is
s



