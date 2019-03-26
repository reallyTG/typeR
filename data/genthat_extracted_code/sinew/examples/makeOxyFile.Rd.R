library(sinew)


### Name: makeOxyFile
### Title: Inserts roxygen2 skeletons in file(s).
### Aliases: makeOxyFile

### ** Examples

## Not run: 
##D if(interactive()){
##D  makeOxyFile() # default args, opens system file selection dialogue
##D  }
##D  makeOxyFile("./myRfunctions/utils.R") # on one R file
##D  makeOxyFile("./myRfunctions/") # on all R files in directory
##D 
##D  # adds more fields to defaults, passes "cut" to makeImport
##D 
##D  sinew_opts$append(list(add_fields=c("concept", "describeIn")))
##D  makeOxyFile("./myRfunctions/utils.R", cut = 5)
##D  
## End(Not run)



