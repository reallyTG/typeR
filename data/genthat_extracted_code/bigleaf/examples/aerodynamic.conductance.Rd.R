library(bigleaf)


### Name: aerodynamic.conductance
### Title: Aerodynamic Conductance
### Aliases: aerodynamic.conductance

### ** Examples

df <- data.frame(Tair=25,pressure=100,wind=c(3,4,5),ustar=c(0.5,0.6,0.65),H=c(200,230,250))   
 
# simple calculation of Ga  
aerodynamic.conductance(df,Rb_model="Thom_1972") 

# calculation of Ga using a model derived from the logarithmic wind profile
aerodynamic.conductance(df,Rb_model="Thom_1972",zr=40,zh=25,d=17.5,z0m=2,wind_profile=TRUE) 

# simple calculation of Ga, but a physically based canopy boundary layer model
aerodynamic.conductance(df,Rb_model="Su_2001",zr=40,zh=25,d=17.5,Dl=0.05,N=2,fc=0.8)




