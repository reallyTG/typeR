library(rnoaa)


### Name: ghcnd_search
### Title: Get a cleaned version of GHCND data from a single weather site
### Aliases: ghcnd_search

### ** Examples

## Not run: 
##D # Search based on variable and/or date
##D ghcnd_search("AGE00147704", var = "PRCP")
##D ghcnd_search("AGE00147704", var = "PRCP", date_min = "1920-01-01")
##D ghcnd_search("AGE00147704", var = "PRCP", date_max = "1915-01-01")
##D ghcnd_search("AGE00147704", var = "PRCP", date_min = "1920-01-01",
##D              date_max = "1925-01-01")
##D ghcnd_search("AGE00147704", date_min = "1920-01-01", date_max = "1925-01-01")
##D ghcnd_search("AGE00147704", var = c("PRCP","TMIN"))
##D ghcnd_search("AGE00147704", var = c("PRCP","TMIN"), date_min = "1920-01-01")
##D ghcnd_search("AGE00147704", var = "adfdf")
## End(Not run)



