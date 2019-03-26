library(osrmr)


### Name: viaroute
### Title: travel time or full information of a route
### Aliases: viaroute

### ** Examples

# direct examples of the online API
## Not run: 
##D #' link <- "http://router.project-osrm.org/route/v1/driving/8.1,47.1;8.3,46.9?steps=false"
##D a <- rjson::fromJSON(file = link)
##D 
##D # example with onlinehost API5
##D osrmr:::viaroute(47.1, 8.1, 46.9, 8.3, FALSE, 5, FALSE)
##D 
##D # examples with localhost API4/API5
##D Sys.setenv("OSRM_PATH"="C:/OSRM_API4")
##D osrmr::run_server("switzerland-latest.osrm")
##D osrmr::viaroute(47.1, 8.1, 46.9, 8.3, FALSE, 4, TRUE)
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH")
##D 
##D Sys.setenv("OSRM_PATH"="C:/OSRM_API5")
##D osrmr::run_server("switzerland-latest.osrm")
##D osrmr::viaroute(47.1, 8.1, 46.9, 8.3, FALSE, 5, TRUE)
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH")
## End(Not run)



