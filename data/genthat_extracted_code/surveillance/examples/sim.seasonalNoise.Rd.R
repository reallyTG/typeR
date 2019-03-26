library(surveillance)


### Name: sim.seasonalNoise
### Title: Generation of Background Noise for Simulated Timeseries
### Aliases: sim.seasonalNoise
### Keywords: datagen

### ** Examples

season <- sim.seasonalNoise(length = 300)
plot(season$seasonalBackground,type = "l")

# use a negative timetrend beta
season <- sim.seasonalNoise(beta = -0.003, length = 300)
plot(season$seasonalBackground,type = "l")



