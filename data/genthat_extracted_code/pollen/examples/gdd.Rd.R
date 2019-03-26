library(pollen)


### Name: gdd
### Title: Growing Degree Days Function
### Aliases: gdd
### Keywords: meteo, temperature

### ** Examples

set.seed(25)
df <- data.frame(tmax=runif(100, 6, 10), tmin=runif(100, 4,6))

gdd(tmax = df$tmax, tmin = df$tmin, tbase = 5, tbase_max = 30)





