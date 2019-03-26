library(wux)


### Name: CMIP5toModelinput
### Title: Creates a "modelinput" input file based on CMIP5 data on your
###   disk to be further processed by models2wux.
### Aliases: CMIP5toModelinput
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
##D 
##D ## create the corresponding modelinput list:
##D CMIP5toModelinput(filedir = "~/tmp/CMIP5",
##D                   save.to = "~/tmp/CMIP5_modelinput.R")
##D 
## End(Not run)



