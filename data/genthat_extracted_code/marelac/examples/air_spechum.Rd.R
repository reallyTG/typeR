library(marelac)


### Name: air_spechum
### Title: Air specific humidity
### Aliases: air_spechum
### Keywords: utilities

### ** Examples

air_spechum(t = 25, rh = 50)*1000     # 9.7778
plot(0:30, air_spechum(t = 0:30), xlab = "Temperature, dgC", ylab = "kg/kg")
plot(0:100, air_spechum(rh = 0:100), xlab = "percent humidity", ylab = "kg/kg")



