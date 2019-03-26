library(osrmr)


### Name: nearest
### Title: nearest accessible position
### Aliases: nearest

### ** Examples

## Not run: 
##D osrmr::nearest(47,9, 5, FALSE)
##D 
##D Sys.setenv("OSRM_PATH_API_5"="C:/OSRM_API5")
##D osrmr::run_server(Sys.getenv("OSRM_PATH_API_5"), "switzerland-latest.osrm")
##D osrmr::nearest(47,9, 5, TRUE)
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH_API_5")
##D 
##D Sys.setenv("OSRM_PATH_API_4"="C:/OSRM_API4")
##D osrmr::run_server(Sys.getenv("OSRM_PATH_API_4"), "switzerland-latest.osrm")
##D osrmr::nearest(47,9, 4, TRUE)
##D osrmr::quit_server()
##D Sys.unsetenv("OSRM_PATH_API_4")
## End(Not run)



