library(emuR)


### Name: plafit
### Title: Calculate the coefficients of a parabola
### Aliases: plafit
### Keywords: math

### ** Examples


# fit a polynomial to a segment of fundamental frequency data
plafit(vowlax.fund[1,]$data)

# return the fitted values of the polynomial
plafit(vowlax.fund[1,]$data, fit=TRUE)





