library(Thermimage)


### Name: airviscosity
### Title: Returns air viscosity for a given air temperature.
### Aliases: airviscosity

### ** Examples


## The function is currently defined as
function (Ta = 20) 
{
    Intercept <- 13.17380952
    Slope <- 0.097457143
    k <- (Intercept + Slope * Ta) * 1e-06
    k
  }
# Example calculation
Ta<-20
airviscosity(Ta)



