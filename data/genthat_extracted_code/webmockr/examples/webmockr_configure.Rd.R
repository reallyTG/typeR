library(webmockr)


### Name: webmockr_configure
### Title: webmockr configuration
### Aliases: webmockr_configure webmockr_configure_reset
###   webmockr_configuration webmockr_allow_net_connect
###   webmockr_disable_net_connect webmockr_net_connect_allowed

### ** Examples

## Not run: 
##D webmockr_configure()
##D webmockr_configure(
##D  allow_localhost = TRUE
##D )
##D webmockr_configuration()
##D webmockr_configure_reset()
##D 
##D webmockr_allow_net_connect()
##D webmockr_net_connect_allowed()
##D 
##D # disable net connect for any URIs
##D webmockr_disable_net_connect()
##D ### gives NULL with no URI passed
##D webmockr_net_connect_allowed()
##D # disable net connect EXCEPT FOR given URIs
##D webmockr_disable_net_connect(allow = "google.com")
##D ### is a specific URI allowed?
##D webmockr_net_connect_allowed("google.com")
## End(Not run)



