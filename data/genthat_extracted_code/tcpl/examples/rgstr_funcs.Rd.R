library(tcpl)


### Name: Register/update annotation
### Title: Functions for registering & updating annotation information
### Aliases: 'Register/update annotation' tcplRegister tcplUpdate

### ** Examples


## Not run: 
##D ## Store the current config settings, so they can be reloaded at the end 
##D ## of the examples
##D conf_store <- tcplConfList()
##D tcplConfDefault()
##D 
##D ## Load current ASID information
##D tcplLoadAsid()
##D 
##D ## Register a new assay source
##D tcplRegister(what = "asid", flds = list(asnm = "example_asid"))
##D 
##D ## Show the newly registered ASID
##D tcplLoadAsid(add.fld = "assay_source_desc")
##D 
##D ## Notice that the newly created ASID does not have an assay_source_desc.
##D ## The field could have been defined during the registration process, but
##D ## can also be updated using tcplUpdate
##D i1 <- tcplLoadAsid()[asnm == "example_asid", asid]
##D tcplUpdate(what = "asid", 
##D            id = i1, 
##D            flds = list(assay_source_desc = "example asid description"))
##D tcplLoadAsid(add.fld = "assay_source_desc")
##D 
##D ## Remove the created ASID. Note: Manually deleting primary keys can cause
##D ## serious database problems and should not generally be done. 
##D 
##D ## If using the tcplLite DRVR, must specify table name
##D if (conf_store$TCPL_DRVR == 'MySQL') {
##D   tcplSendQuery(paste0("DELETE FROM assay_source WHERE asid = ", i1, ";"))
##D } else {
##D   qy <- paste0("SELECT * FROM assay_source WHERE NOT asid = ", i1, ";")
##D   tcplSendQuery(qy, tbl='assay_source', delete=TRUE)
##D }
##D 
##D ## Reset configuration
##D options(conf_store)
## End(Not run)




