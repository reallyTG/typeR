library(marelac)


### Name: air_density
### Title: Air Density
### Aliases: air_density
### Keywords: utilities

### ** Examples

air_density(t = 25) # 1.183894
plot(0:30, air_density(t = 0:30), xlab = "Temperature, dgC", ylab = "kg/m3")
plot(x= seq(0.8,1.2, 0.01), y = air_density(P = seq(0.8,1.2, 0.01)),
     xlab = "pressure, bar", ylab = "kg/m3")



