library(skyscapeR)


### Name: orbit
### Title: Calculate visible path of celestial object at given location
### Aliases: orbit

### ** Examples

# Visible path of sun on June Solstice on year 3999 BC from London:
sun.dec <- jS(-4000)
london.lat <- 51.5074 #N
london.lon <- -0.1278 #W
loc <- c( london.lat, london.lon )
path <- orbit(sun.dec, loc)
plot(path$az, path$alt, ylim=c(0,90), type='l', xlab='AZ', ylab='ALT', col='red', lwd=2)



