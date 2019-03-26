library(Thermimage)


### Name: airtconductivity
### Title: Thermal conductivity of air.
### Aliases: airtconductivity

### ** Examples

## The function is currently defined as
function (Ta = 20) 
{
    Intercept <- 0.024280952
    Slope <- 7.07143e-05
    k <- Intercept + Slope * Ta
    k
  }
# Example calculation:
Ta<-20
airtconductivity(Ta)



