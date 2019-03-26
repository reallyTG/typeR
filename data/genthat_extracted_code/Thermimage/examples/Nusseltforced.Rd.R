library(Thermimage)


### Name: Nusseltforced
### Title: Nusselt number for forced convection.
### Aliases: Nusseltforced

### ** Examples


## The function is currently defined as
function (c = NULL, n = NULL, V = 1, L = 0.1, Ta = 20, shape="hcylinder") 
{
    Nu <- c * Reynolds(V, L, Ta)^n
    Nu
  }
  
# Example
# Usually called from the hconv() or qconv() functions
V<-1
L<-0.1
Ta<-20
shape="hcylinder"

Nu<-Nusseltforced(V=V, L=L, Ta=Ta, shape=shape)




