library(NADA)


### Name: cenfit-class
### Title: Class "cenfit"
### Aliases: cenfit-class [,cenfit,numeric,missing-method
###   [,cenfit,numeric,missing,ANY-method
### Keywords: classes

### ** Examples

    obs      = c(0.5,    0.5,   1.0,  1.5,   5.0,    10,   100)
    censored = c(TRUE, FALSE, FALSE, TRUE, FALSE, FALSE, FALSE)

    class(cenfit(Cen(obs, censored)))



