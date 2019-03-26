library(Thermimage)


### Name: qconv
### Title: Estimates the area specific heat transfer by convection (W/m2)
### Aliases: qconv

### ** Examples

## The function is currently defined as
function (Ts = 30, Ta = 20, V = 1, L = 0.1, c = NULL, n = NULL, a=NULL,
    b = NULL, m = NULL, type = "forced", shape="hcylinder") 
{
    qconv <- (Ta - Ts) * hconv(Ta = 20, V = 1, L = 0.1, c = NULL, n = NULL, a=NULL,
    b = NULL, m = NULL, type = "forced", shape="hcylinder")
    qconv
  }

# Example:
Ts<-30
Ta<-20
V<-1
L<-0.1
type="forced"
shape="hcylinder"

qconv(Ts=Ts, Ta=Ta, V=V, L=L, type=type, shape=shape)

qconv(Ts=Ts, Ta=Ta, V=V, L=L, type=type, shape="sphere")

# For detailed examples and explanations, see:
# https://github.com/gtatters/Thermimage/blob/master/HeatTransferCalculations.md
  



