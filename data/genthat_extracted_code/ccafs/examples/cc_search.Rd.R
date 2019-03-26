library(ccafs)


### Name: cc_search
### Title: Search CCAFS data
### Aliases: cc_search

### ** Examples

(res <- cc_search(file_set = 12, extent = "global", format = "ascii",
  period = 4, variable = 1, resolution = 4))

## Not run: 
##D res <- cc_search(file_set = 7, extent = "region", format = "ascii",
##D   period = 9, variable = 5, resolution = 6)
##D cc_data_fetch(res[3])
##D 
##D # Alternatively, you can use the helper list
##D # where you can reference options by name
##D # the downside is that this is very verbose
##D (res <- cc_search(file_set = cc_params$file_set$`Delta method IPCC AR4`,
##D                   scenario = cc_params$scenario$`SRES B1`,
##D                   model = cc_params$model$bccr_bcm2_0,
##D                   extent = cc_params$extent$global,
##D                   format = cc_params$format$ascii,
##D                   period = cc_params$period$`2040s`,
##D                   variable = cc_params$variable$Precipitation,
##D                   resolution = cc_params$resolution$`5 minutes`))
## End(Not run)



