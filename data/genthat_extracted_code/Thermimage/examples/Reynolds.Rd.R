library(Thermimage)


### Name: Reynolds
### Title: Calculates the Reynolds number.
### Aliases: Reynolds

### ** Examples

## The function is currently defined as
function (V, L, v) 
{
  v<-airviscosity(Ta)
  Re<-V*L/v
  }

# Typical values for Reynolds numbers range from 6.6 to 6.6e+5 

# Example calculation:
V<-1
L<-1
Ta<-20
v<-airviscosity(Ta)
Reynolds(V, L, v)




