library(sidrar)


### Name: get_sidra
### Title: Get SIDRA's table
### Aliases: get_sidra
### Keywords: IBGE sidra

### ** Examples

## Not run: 
##D ## Requesting table 1419 (Consumer Price Index - IPCA) from the API
##D ipca <- get_sidra(1419,
##D                   variable = 69,
##D                   period = c("201212","201401-201412"),
##D                   geo = "City",
##D                   geo.filter = list("State" = 50))
##D 
##D ## Urban population count from Census data (2010) for States and cities of Southest region.
##D get_sidra(1378,
##D           variable = 93,
##D           geo = c("State","City"),
##D           geo.filter = list("Region" = 3, "Region" = 3),
##D           classific = c("c1"),
##D           category = list(1))
##D  
##D ## Number of informants by state in the Inventory Research (last data available) 
##D get_sidra(api = "/t/254/n1/all/n3/all/v/151/p/last%201/c162/118423/c163/0")
##D 
## End(Not run)




