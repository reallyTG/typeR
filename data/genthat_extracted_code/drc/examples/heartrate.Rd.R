library(drc)


### Name: heartrate
### Title: Heart rate baroreflexes for rabbits
### Aliases: heartrate
### Keywords: datasets

### ** Examples


## Fitting the baro5 model
heartrate.m1 <- drm(rate~pressure, data=heartrate, fct=baro5())
plot(heartrate.m1)

coef(heartrate.m1)

#Output:
#b1:(Intercept) b2:(Intercept)  c:(Intercept)  d:(Intercept)  e:(Intercept)
#      11.07984       46.67492      150.33588      351.29613       75.59392

## Inserting the estimated baro5 model function in deriv()
baro5Derivative <- deriv(~ 150.33588 + ((351.29613 - 150.33588)/
(1 + (1/(1 + exp((2 * 11.07984 * 46.67492/(11.07984 + 46.67492)) * 
(log(x) - log(75.59392 ))))) * (exp(11.07984 * (log(x) - log(75.59392)))) + 
(1 - (1/(1 + exp((2 * 11.07984 * 46.67492/(11.07984 + 46.67492)) * 
(log(x) - log(75.59392 )))))) * (exp(46.67492 * (log(x) - log(75.59392 )))))), "x", function(x){})

## Plotting the derivative
#pressureVector <- 50:100
pressureVector <- seq(50, 100, length.out=300)
derivativeVector <- attr(baro5Derivative(pressureVector), "gradient")
plot(pressureVector, derivativeVector, type = "l")

## Finding the minimum
pressureVector[which.min(derivativeVector)]





