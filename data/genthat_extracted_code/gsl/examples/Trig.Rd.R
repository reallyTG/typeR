library(gsl)


### Name: Trig
### Title: Trig functions
### Aliases: Trig trig gsl_sf_sin gsl_sf_cos hypot sinc complex_sin
###   complex_cos complex_logsin lnsinh lncosh
### Keywords: array

### ** Examples


x <- seq(from=0,to=2,by=0.01)
gsl_sf_sin(x)   #table xx of Ab and St
gsl_sf_cos(x)   #table xx of Ab and St

f <- function(x){abs(sin(x+1)-sin(x)*cos(1)-cos(x)*sin(1))}
g <-
function(x){abs(gsl_sf_sin(x+1)-gsl_sf_sin(x)*gsl_sf_cos(1)-gsl_sf_cos(x)*gsl_sf_sin(1))}

f(100000:100010)
g(100000:100010)





