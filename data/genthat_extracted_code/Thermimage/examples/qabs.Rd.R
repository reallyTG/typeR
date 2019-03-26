library(Thermimage)


### Name: qabs
### Title: Estimates the absorbed solar and infrared radiation (W/m2)
### Aliases: qabs

### ** Examples

## The function is currently defined as
function (Ta = 25, Tg = NULL, RH = 0.5, E = 0.96, rho = 0.1, 
    cloud = 0, SE = 100) 
{
    if (length(SE) == 1) 
        SE <- rep(SE, length(Ta))
    if (is.null(Tg)) 
        Tg <- Tg(Ta, SE)
    Ld <- Ld(Ta, RH = RH, n = cloud)
    Lu <- Lu(Tg)
    IR <- E * (Lu + Ld)/2
    qabs <- (1 - rho) * SE + IR
    qabs
  }
  
# Example:
Ta<-25
Tg<-30
RH<-0.5
E<-0.96
rho<-0.1
cloud=0
SE<-100
qabs(Ta, Tg, RH, E, rho, cloud, SE)

# If Tg is unknown it can be set to NULL, and the qabs function will estimate Tg from
# an empirical relationship of Tg vs Ta and SE from the Tground() function

qabs(Ta, Tg=NULL, RH, E, rho, cloud, SE)

# For detailed examples and explanations, see:
# https://github.com/gtatters/Thermimage/blob/master/HeatTransferCalculations.md
  



