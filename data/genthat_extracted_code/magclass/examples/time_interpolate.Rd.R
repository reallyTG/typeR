library(magclass)


### Name: time_interpolate
### Title: time_interpolate
### Aliases: time_interpolate

### ** Examples


data(population_magpie)
time_interpolate(population_magpie,"y2000",integrate=TRUE)
time_interpolate(population_magpie,c("y1980","y2000"),integrate=TRUE,extrapolation_type="constant")




