library(dynatopmodel)


### Name: approx.pe.ts
### Title: Create sinsuiodal time series of potential evapotranspiration
###   input
### Aliases: approx.pe.ts

### ** Examples

## Not run: 
##D # Create PE data for 2012 for use in the Brompton test case
##D 
##D require(dynatopmodel)
##D 
##D data("brompton")
##D 
##D # Generate time series at hourly and 15 minute intervals
##D pe.60 <- approx.pe.ts("2012-01-01", "2012-12-31", dt=1)
##D pe.15 <- approx.pe.ts("2012-01-01", "2012-12-31", dt=0.25)
##D 
##D # Check annual totals - should be around 900mm
##D sum(pe.60)*1000
##D sum(pe.15*0.25)*1000
##D 
##D # Check maximum daily total on the 1st of July
##D sum(pe.60["2012-07-01"])*1000
##D sum(pe.15["2012-07-01"]*0.25)*1000
## End(Not run)



