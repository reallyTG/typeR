library(osrmr)


### Name: server_address
### Title: server_address() returns the URL address of the OSRM localhost
###   or OSRM webserver, depending on the value of the variable
###   'use_localhost'. This is an internal function. The address is used as
###   a part of a OSRM server-request.
### Aliases: server_address

### ** Examples

osrmr:::server_address(TRUE)
# [1] "http://localhost:5000"
osrmr:::server_address(FALSE)
# [1] "http://router.project-osrm.org"



