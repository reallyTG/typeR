library(miscTools)


### Name: rSquared
### Title: Calculate R squared value
### Aliases: rSquared
### Keywords: univar multivariate array

### ** Examples

   data( "Electricity", package = "Ecdat" )
   reg <- lm( cost ~ q + pl + pk + pf, Electricity )
   rSquared( Electricity$cost, reg$residuals )
   summary( reg )$r.squared  # returns the same value



