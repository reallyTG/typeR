library(taxize)


### Name: iucn_summary
### Title: Get a summary from the IUCN Red List
### Aliases: iucn_summary iucn_summary_id

### ** Examples

## Not run: 
##D # if you send a taxon name, an IUCN API key is required
##D ## here, the key is being detected from a .Rprofile file
##D ## or .Renviron file, See "Redlist Authentication" above
##D iucn_summary("Lutra lutra")
##D 
##D ia <- iucn_summary(c("Panthera uncia", "Lynx lynx"))
##D ia <- iucn_summary(c("Panthera uncia", "Lynx lynx", "aaa"))
##D 
##D ## get detailed distribution
##D iac <- iucn_summary(x="Ara chloropterus", distr_detail = TRUE)
##D iac[[1]]$distr
##D 
##D 
##D # If you pass in an IUCN ID, you don't need to pass in a Redlist API Key
##D ia <- iucn_summary_id(c(22732, 12519))
##D # extract status
##D iucn_status(ia)
##D # extract other available information
##D ia[['Lynx lynx']]$history
##D ia[['Panthera uncia']]$distr
##D ia[[2]]$trend
##D ## the outputs aren't quite identical, but we're working on it
##D identical(
##D   iucn_summary_id(c(22732, 12519)),
##D   iucn_summary(as.iucn(c(22732, 12519)))
##D )
##D 
##D # using parallel, e.g., with doMC package, register cores first
##D # library(doMC)
##D # registerDoMC(cores = 2)
##D # nms <- c("Panthera uncia", "Lynx lynx", "Ara chloropterus", "Lutra lutra")
##D # (res <- iucn_summary(nms, parallel = TRUE))
## End(Not run)



