library(blscrapeR)


### Name: bls_map_state
### Title: choropleth mapping of BLS data
### Aliases: bls_map_state
### Keywords: api bls economics geo geography map unemployment

### ** Examples

## Not run: 
##D # Downlaod employment statistics for April 2016.
##D df <- get_bls_state("April 2016", seasonality = TRUE)
##D 
##D # Map the unemployment rate from data set.
##D bls_gg <- bls_map_state(map_data = df, fill_rate = "unemployed_rate", 
##D              labtitle = "Unemployment Rate")
##D bls_gg
## End(Not run)






