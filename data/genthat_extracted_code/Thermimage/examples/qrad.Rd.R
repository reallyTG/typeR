library(Thermimage)


### Name: qrad
### Title: Estimates the area specific heat transfer by radiation (W/m2)
### Aliases: qrad

### ** Examples


## The function is currently defined as
function (Ts = 30, Ta = 25, Tg = NULL, RH = 0.5, E = 0.96, rho = 0.1, 
    cloud = 0, SE = 0) 
{
    qrad <- qabs(Ta = Ta, Tg = Tg, RH = RH, E = E, rho = rho, 
        cloud = cloud, SE = SE) - E * StephBoltz() * (Ts + 273.15)^4
    qrad
  }

# Example:
Ts<-30
Ta<-25
Tg<-28
RH<-0.5
E<-0.96
rho<-0.1
cloud<-0
SE<-100
# qrad should result in a positive gain of heat:
qrad(Ts, Ta, Tg, RH, E, rho, cloud, SE)

# if rho is elevated (i.e. doubles reflectance of solar energy), heat exchange by 
# radiation is reduced
rho<-0.2
qrad(Ts, Ta, Tg, RH, E, rho, cloud, SE)

# But if solar energy = 0, under similar conditions, qrad is negative:
SE<-0
qrad(Ts, Ta, Tg, RH, E, rho, cloud, SE)

# For detailed examples and explanations, see:
# https://github.com/gtatters/Thermimage/blob/master/HeatTransferCalculations.md
  





