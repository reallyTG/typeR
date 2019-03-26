library(rLakeAnalyzer)


### Name: water.density
### Title: Estimate Water Density
### Aliases: water.density
### Keywords: arith

### ** Examples


#Plot water density for water between 1 and 30 deg C
dens = water.density(1:30)
plot(1:30, dens, xlab="Temp(deg C)", ylab="Density(kg/m^3)")



