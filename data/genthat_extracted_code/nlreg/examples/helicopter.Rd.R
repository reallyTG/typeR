library(nlreg)


### Name: helicopter
### Title: Helicopter Data
### Aliases: helicopter
### Keywords: datasets

### ** Examples

data(helicopter)
##
## fit model (5) of Annis (2005)
## -----------------------------
heli <- helicopter
##
heli$LW <- heli$L * heli$W
heli$S <- heli$B * heli$H + ( 2 * heli$L + 1 ) * heli$W
heli$logTime <- log( heli$Time )
heli$Y <- heli$logTime + log( heli$S ) / 2
#
heli.nlreg <- nlreg( Y ~ b0 + b1 * log( b2^2 / LW + LW ), data = heli, 
                    start = c( b0 = 6, b1 = -1, b2 = 20 ) )



