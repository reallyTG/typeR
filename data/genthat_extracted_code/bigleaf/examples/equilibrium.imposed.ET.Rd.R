library(bigleaf)


### Name: equilibrium.imposed.ET
### Title: Equilibrium and Imposed Evapotranspiration
### Aliases: equilibrium.imposed.ET

### ** Examples

df <- data.frame(Tair=20,pressure=100,VPD=seq(0.5,4,0.5),
                 Gs_ms=seq(0.01,0.002,length.out=8),Rn=seq(50,400,50))            
equilibrium.imposed.ET(df)            
            



