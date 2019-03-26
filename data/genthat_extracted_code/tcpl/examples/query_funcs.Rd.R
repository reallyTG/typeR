library(tcpl)


### Name: Query functions
### Title: Wrappers for sending queries and fetching results
### Aliases: 'Query functions' tcplQuery tcplSendQuery

### ** Examples


## Store the current config settings, so they can be reloaded at the end 
## of the examples
conf_store <- tcplConfList()
TCPLlite <- file.path(system.file(package = "tcpl"), "example")
tcplConf(db = TCPLlite, user = NA, host = NA, drvr = "tcplLite")

tcplQuery("SELECT 'Hello World';")

## When using tcplLite, name of table must be passed into tcplQuery
if (conf_store$TCPL_DRVR == 'MySQL') {
  tcplQuery("SELECT * FROM assay;")
} else {
  tcplQuery("SELECT * FROM assay;", tbl='assay')
}
 
## Reset configuration
options(conf_store)




