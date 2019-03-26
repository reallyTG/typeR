library(bigleaf)


### Name: roughness.parameters
### Title: Roughness Parameters
### Aliases: roughness.parameters

### ** Examples

# estimate d and z0m from canopy height for a dense (LAI=5) and open (LAI=2) canopy
roughness.parameters(method="canopy_height&LAI",zh=25,LAI=5)
roughness.parameters(method="canopy_height&LAI",zh=25,LAI=2)   
   
# fix d to 0.7*zh and estimate z0m from the wind profile
df <- data.frame(Tair=c(25,25,25),pressure=100,wind=c(3,4,5),ustar=c(0.5,0.6,0.65),H=200)
roughness.parameters(method="wind_profile",zh=25,zr=40,frac_d=0.7,data=df)

# assume d = 0.8*zh
roughness.parameters(method="wind_profile",zh=25,zr=40,frac_d=0.8,data=df) 




