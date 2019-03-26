library(metR)


### Name: waves
### Title: Fourier transform
### Aliases: waves FitWave BuildWave FilterWave

### ** Examples

data(geopotential)
library(data.table)
# January mean of geopotential height
jan <- geopotential[month(date) == 1, .(gh = mean(gh)), by = .(lon, lat)]

# Stationary waves for each latitude
jan.waves <- jan[, FitWave(gh, 1:4), by = .(lat)]
library(ggplot2)
ggplot(jan.waves, aes(lat, amplitude, color = factor(k))) +
    geom_line()

# Build field of wavenumber 1
jan[, gh.1 := BuildWave(lon*pi/180, wave = FitWave(gh, 1)), by = .(lat)]
ggplot(jan, aes(lon, lat)) +
    geom_contour(aes(z = gh.1, color = ..level..)) +
    coord_polar()

# Build fields of wavenumber 1 and 2
waves <- jan[, BuildWave(lon*pi/180, wave = FitWave(gh, 1:2), sum = FALSE), by = .(lat)]
waves[, lon := x*180/pi]
ggplot(waves, aes(lon, lat)) +
    geom_contour(aes(z = y, color = ..level..)) +
    facet_wrap(~k) +
    coord_polar()

# Field with waves 0 to 2 filtered
jan[, gh.no12 := gh - BuildWave(lon*pi/180, wave = FitWave(gh, 0:2)), by = .(lat)]
ggplot(jan, aes(lon, lat)) +
    geom_contour(aes(z = gh.no12, color = ..level..)) +
    coord_polar()

# Much faster
jan[, gh.no12 := FilterWave(gh, -2:0), by = .(lat)]
ggplot(jan, aes(lon, lat)) +
    geom_contour(aes(z = gh.no12, color = ..level..)) +
    coord_polar()

# Using positive numbers returns the field
jan[, gh.only12 := FilterWave(gh, 2:1), by = .(lat)]
ggplot(jan, aes(lon, lat)) +
    geom_contour(aes(z = gh.only12, color = ..level..)) +
    coord_polar()





