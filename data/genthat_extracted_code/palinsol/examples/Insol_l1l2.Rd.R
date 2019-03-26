library(palinsol)


### Name: Insol_l1l2
### Title: Time-integrated insolation
### Aliases: Insol_l1l2 Insol_d1d2

### ** Examples

## reproduces Table 1a of Berger et al. 2010:
lat <- seq(85, -85, -10) * pi/180. ## angles in radiants. 
orbit=c(eps=  23.446 * pi/180., ecc= 0.016724, varpi= (102.04 - 180)* pi/180. )
T <-  sapply(lat, function(x) c(lat = x * 180/pi, 
        m1 =  Insol_l1l2(orbit, 0, 70 * pi/180, lat=x, ell= TRUE, S0=1368) / 1e3,
        m2 =  Insol_l1l2(orbit, 0, 70 * pi/180, lat=x, ell=FALSE, S0=1368) / 1e3) ) 
data.frame(t(T))
 ## reproduces Table 1b of Berger et al. 2010:
lat <- c(85, 55, 0, -55, -85) * pi/180. ## angles in radiants. 
T <-  sapply(lat, function(x) c(lat = x * 180/pi, 
         m1 =  Insol_l1l2(orbit, 30 * pi/180. , 75 * pi/180, 
               lat=x, ell= TRUE, S0=1368) / 1e3,
         m2 =  Insol_l1l2(orbit, 30 * pi/180. , 75 * pi/180, 
               lat=x, ell=FALSE, S0=1368) / 1e3) ) 
 ## reproduces Table 2a of Berger et al. 2010:
lat <- seq(85, -85, -10) * pi/180. ## angles in radiants. 

## 21 march in a 360-d year. By definition : day 80 = 21 march at 12u
d1 = 79.5 
d2 = 79.5 + (10 + 30 + 30 ) * 360/365.2425 ## 30th May in a 360-d year

T <-  sapply(lat, function(x) c(lat = x * 180/pi, 
        m1 =  Insol_d1d2(orbit, d1,d2, lat=x, ell= TRUE, S0=1368) / 1e3,
        m2 =  Insol_d1d2(orbit, d1,d2, lat=x, ell= FALSE, S0=1368) / 1e3))
                          
## I did not quite get the same results as on the table 
## on this one; probably a matter of calendar
## note : the authors in fact used S0=1368 (pers. comm.) 
## 1366 in the paper is a misprint

data.frame(t(T))



