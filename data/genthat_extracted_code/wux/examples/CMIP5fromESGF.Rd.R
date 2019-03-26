library(wux)


### Name: CMIP5fromESGF
### Title: Downloads CMIP5 climate simulations from the ESGF data portal
### Aliases: CMIP5fromESGF
### Keywords: IO file connection database programming interface

### ** Examples

## Not run: 
##D ## download temperature fields of two example GCMs (NorESM1-M and
##D ## CanESM2) with the  RCP 8.5 and the historical run
##D ## into your temporary directory. This command will create a folder
##D ## "CMIP5" in "~/tmp" with two subfolders for each model again with
##D ## two subfolders for each experiment.
##D CMIP5fromESGF(save.to = "~/tmp/CMIP5/",
##D               models = c("NorESM1-M", "CanESM2"),
##D               variables = c("tas"),
##D               experiments= c("historical", "rcp85"))
## End(Not run)



