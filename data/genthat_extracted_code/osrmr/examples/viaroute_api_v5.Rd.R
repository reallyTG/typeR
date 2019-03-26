library(osrmr)


### Name: viaroute_api_v5
### Title: travel time or full information of a route for OSRM API 5
### Aliases: viaroute_api_v5

### ** Examples

## Not run: 
##D # example with onlinehost
##D osrmr:::viaroute_api_v5(47, 9, 48, 10 , FALSE, osrmr:::server_address(FALSE))
##D 
##D # example with localhost
##D Sys.setenv("OSRM_PATH"="C:/OSRM_API5")
##D osrmr::run_server("switzerland-latest.osrm")
##D osrmr:::viaroute_api_v5(47, 9, 48, 10 , FALSE, osrmr:::server_address(TRUE))
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH")
## End(Not run)



