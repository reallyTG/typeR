library(bigleaf)


### Name: surface.conditions
### Title: Big-Leaf Surface Conditions
### Aliases: surface.conditions

### ** Examples

# calculate surface temperature, water vapor, VPD etc. at the surface
# for a given temperature and turbulent fluxes, and under different 
# aerodynamic conductance.
surface.conditions(Tair=25,pressure=100,LE=100,H=200,VPD=1.2,Ga=c(0.02,0.05,0.1)) 
         
# now calculate also surface CO2 concentration
surface.conditions(Tair=25,pressure=100,LE=100,H=200,VPD=1.2,Ga=c(0.02,0.05,0.1),
                   Ca=400,Ga_CO2=c(0.02,0.05,0.1),NEE=-20,calc.surface.CO2=TRUE)
                   



