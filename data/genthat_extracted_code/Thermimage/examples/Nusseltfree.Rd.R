library(Thermimage)


### Name: Nusseltfree
### Title: Nusselt number for free convection.
### Aliases: Nusseltfree

### ** Examples


## The function is currently defined as
function (a=NULL, b = NULL, m = NULL, L = 0.1, Ts = 20, Ta = 20) 
{
    Nu <- b * (Grashof(L, Ts, Ta)*Prandtl(Ta)^a)^m
    Nu
  }

# Nusselt number for free convection
# Example calculation:

a<-1
b<-0.58
m<-0.25
L<-1
Ts<-30
Ta<-20
Nusseltfree(a,b,m,L,Ts,Ta)


# Free convection is higher when surface temperatures are elevated.  This is the effect
# that free convection predicts: greater molecular energy of air surrounding a warmer surface
# leading to air currents over top of a warm surface.

Ts<-40
Nusseltfree(a,b,m,L,Ts,Ta)







