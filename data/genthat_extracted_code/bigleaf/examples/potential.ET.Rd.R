library(bigleaf)


### Name: potential.ET
### Title: Potential Evapotranspiration
### Aliases: potential.ET

### ** Examples

# Calculate potential ET of a surface that receives a net radiation of 500 Wm-2
# using Priestley-Taylor:
potential.ET(Tair=30,pressure=100,Rn=500,alpha=1.26,approach="Priestley-Taylor")    

# Calculate potential ET for a surface with known Gs (0.5 mol m-2 s-1) and Ga (0.1 m s-1)
# using Penman-Monteith:
LE_pot_PM <- potential.ET(Gs_pot=0.5,Tair=20,pressure=100,VPD=2,Ga=0.1,Rn=400,
                          approach="Penman-Monteith")[,"LE_pot"]
LE_pot_PM

# now cross-check with the inverted equation
surface.conductance(Tair=20,pressure=100,VPD=2,Ga=0.1,Rn=400,LE=LE_pot_PM)



