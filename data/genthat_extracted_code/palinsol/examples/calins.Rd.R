library(palinsol)


### Name: calins
### Title: Caloric insolation
### Aliases: calins

### ** Examples

## reproduces Table 2 of Berger 1978
lat <- seq(90, 0, -10) * pi/180. ## angles in radiants. 
orbit_1 = ber78(0)
orbit_2 = orbit_1
orbit_2 ['eps'] = orbit_2['eps'] + 1*pi/180.

T <-  sapply(lat, function(x) c(lat = x * 180/pi, 
                          calins(orbit_2, lat=x, S0=1365) / (4.18 * 1e1)
                        - calins(orbit_1, lat=x, S0=1365) / (4.18 * 1e1) ) )
data.frame(t(T))
# there are still some differences, of the order of 0.3 %, that are probably related to
# the slightly different methods. 
# 41.8 is the factor from cal/cm2 to  kJ/m2



