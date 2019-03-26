library(oce)


### Name: plot,met-method
### Title: Plot met Data
### Aliases: plot,met-method plot.met

### ** Examples

library(oce)
data(met)
plot(met, which=3:4)

## Wind speed and direction during Hurricane Juan
## Compare with the final figure in a white paper by Chris Fogarty
## (available at http://www.novaweather.net/Hurricane_Juan_files/McNabs_plot.pdf
## downloaded 2017-01-02).
library(oce)
data(met)
t0 <- as.POSIXct("2003-09-29 04:00:00", tz="UTC")
dt <- 12 * 3600
juan <- subset(met, t0 - dt <= time & time <= t0 + dt)
par(mfrow=c(2,1))
plot(juan, which=5)
abline(v=t0)
plot(juan, which=6)
abline(v=t0)




