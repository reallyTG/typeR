library(tsdisagg2)


### Name: tsdisagg2
### Title: Time Series Disaggregation.
### Aliases: tsdisagg2

### ** Examples

anual <- runif( 19, 300, 455 )
indicators <- data.frame( runif( 76, 500, 700 ), runif( 76, 800, 980 ) )

### Constant ###

tsdisagg2( y=anual, x=indicators, c=1, da=1995, dz=2013, plots=1 )
# Estimate model with constant

### Method selection ###

tsdisagg2( y=anual, x=indicators, method="f", da=1995, dz=2013, plots=1 )
# Use option method

### "rho" value ###

tsdisagg2( y=anual, x=indicators, method="cl2", da=1995, dz=2013, plots=1 )
# Search for positive optimal "rho" is enabled (if method="cl2" or method="l")

tsdisagg2( y=anual, x=indicators, method="cl2", rho=0.35, da=1995, dz=2013, plots=1 )
# Set "rho" value manually (the grid search is not performed)

### Interpolation or distribution ###

tsdisagg2( y=anual, x=indicators, da=1995, dz=2013, method="f", type="last" )
# Performs disaggregation by interpolation with type="last" or type="first"

tsdisagg2( y=anual, x=indicators, da=1995, dz=2013, method="f", type="average" )
# Performs disaggregation by distribution with type="sum" or type="average"

### Use returned objects ###
td <- tsdisagg2( y=anual, x=indicators, da=1995, dz=2013, method="f", type="average" )
names(td)
td$BETA_ESTIMATION



