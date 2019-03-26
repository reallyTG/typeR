library(gear)


### Name: geolm
### Title: Linear model for geostatistical data.
### Aliases: geolm

### ** Examples

data = data.frame(y = rnorm(10), x1 = runif(10), 
                 x2 = runif(10))
cmod = cmod.std(model = "exponential", psill = 1, 
                 r = 1)
gearmod = geolm(y ~ x1, data = data,
                 coordnames = c("x1", "x2"),
                 cmod = cmod)



