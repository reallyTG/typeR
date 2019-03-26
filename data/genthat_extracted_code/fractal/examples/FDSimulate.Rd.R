library(fractal)


### Name: FDSimulate
### Title: Simulation of an FD process with time varying model parameters
### Aliases: FDSimulate print.FDSimulate plot.FDSimulate
### Keywords: univar

### ** Examples

## create a time-varying FD parameter, linearly 
## varying from white to pink noise, then jump 
## to a red noise plateau 
delta <- c(seq(0, 0.5, by=0.01), rep(1,100))

## set the innovations variance to unity 
innovation <- rep(1, length(delta))

## simulate a time-varying FD process 
z <- FDSimulate(delta=delta, innovation=innovation)
print(z)
plot(z)



