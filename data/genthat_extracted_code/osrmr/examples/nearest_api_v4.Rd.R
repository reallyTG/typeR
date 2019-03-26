library(osrmr)


### Name: nearest_api_v4
### Title: nearest accessible position for OSRM API v4
### Aliases: nearest_api_v4

### ** Examples

## Not run: 
##D Sys.setenv("OSRM_PATH_API_4"="C:/OSRM_API4")
##D osrmr::run_server(Sys.getenv("OSRM_PATH_API_4"), "switzerland-latest.osrm")
##D osrmr:::nearest_api_v4(47,9, osrmr:::server_address(TRUE))
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH_API_4")
## End(Not run)



