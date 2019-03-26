library(osrmr)


### Name: nearest_api_v5
### Title: nearest accessible position for OSRM API v5
### Aliases: nearest_api_v5

### ** Examples

## Not run: 
##D osrmr:::nearest_api_v5(47,9, osrmr:::server_address(FALSE))
##D Sys.setenv("OSRM_PATH_API_5"="C:/OSRM_API5")
##D osrmr::run_server(Sys.getenv("OSRM_PATH_API_5"), "switzerland-latest.osrm")
##D osrmr:::nearest_api_v5(47,9, osrmr:::server_address(TRUE))
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH_API_5")
## End(Not run)



