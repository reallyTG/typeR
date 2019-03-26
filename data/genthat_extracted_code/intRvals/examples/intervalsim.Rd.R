library(intRvals)


### Name: intervalsim
### Title: Simulate a set of observed intervals
### Aliases: intervalsim

### ** Examples

# simulate observed intervals:
intervals=intervalsim(n=50,mu=200,sigma=40,trunc=c(0,600),fpp=0.1)
# check whether we retrieve the simulation parameters:
estinterval(goosedrop$interval)



