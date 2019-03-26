library(blscrapeR)


### Name: map_bls
### Title: choropleth mapping of BLS data
### Aliases: map_bls
### Keywords: api bls economics geo geography map unemployment

### ** Examples

## Not run: 
##D # Download the most current month unemployment statistics on a county level.
##D df <- get_bls_county()
##D 
##D # Map the unemployment rate by county.
##D bls_gg <- map_bls(map_data = df, fill_rate = "unemployed_rate", 
##D                  labtitle = "Unemployment Rate")
##D bls_gg
##D  
##D # Map the unemployment rate for Florida and Alabama.
##D 
##D df <- get_bls_county(stateName = c("Florida", "Alabama"))
##D 
##D bls_gg <- map_bls(map_data=df, fill_rate = "unemployed_rate", 
##D stateName = c("Florida", "Alabama"))
##D 
##D bls_gg
##D 
##D 
##D # Downlaod state employment statistics for April 2016.
##D df <- get_bls_state("April 2016", seasonality = TRUE)
##D 
##D # Map the unemployment rate from data set.
##D bls_gg <- map_bls(map_data = df, fill_rate = "unemployed_rate", 
##D              labtitle = "Unemployment Rate")
##D bls_gg
##D 
## End(Not run)




