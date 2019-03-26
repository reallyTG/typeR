library(blscrapeR)


### Name: bls_map_county
### Title: choropleth mapping of BLS data
### Aliases: bls_map_county
### Keywords: api bls economics geo geography map unemployment

### ** Examples

## Not run: 
##D # Download the most current month unemployment statistics on a county level.
##D df <- get_bls_county()
##D 
##D # Map the unemployment rate by county.
##D bls_gg <- bls_map_county(map_data = df, fill_rate = "unemployed_rate", 
##D                  labtitle = "Unemployment Rate")
##D bls_gg
##D 
##D 
##D # Map the unemployment rate for Florida and Alabama.
##D 
##D df <- get_bls_county(stateName = c("Florida", "Alabama"))
##D 
##D bls_gg <- bls_map_county(map_data=df, fill_rate = "unemployed_rate", 
##D stateName = c("Florida", "Alabama"))
##D 
##D bls_gg
## End(Not run)





