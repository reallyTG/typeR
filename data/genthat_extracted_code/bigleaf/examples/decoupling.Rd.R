library(bigleaf)


### Name: decoupling
### Title: Canopy-Atmosphere Decoupling Coefficient
### Aliases: decoupling

### ** Examples

# Omega calculated following Jarvis & McNaughton 1986
set.seed(3)
df <- data.frame(Tair=rnorm(20,25,1),pressure=100,Ga_h=rnorm(20,0.06,0.01),
                 Gs_ms=rnorm(20,0.005,0.001))
decoupling(df,approach="Jarvis&McNaughton_1986")

# Omega calculated following Martin 1989 (requires LAI)
decoupling(df,approach="Martin_1989",LAI=4)




