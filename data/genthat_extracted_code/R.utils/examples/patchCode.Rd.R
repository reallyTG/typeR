library(R.utils)


### Name: patchCode
### Title: Patches installed and loaded packages and more
### Aliases: patchCode.default patchCode
### Keywords: utilities programming

### ** Examples
## Not run: 
##D   # Patch all source code files in the current directory
##D   patchCode(".")
##D 
##D   # Patch all source code files in R_PATCHES
##D   options("R_PATCHES"="~/R-patches/")
##D   # alternatively, Sys.setenv("R_PATCHES"="~/R-patches/")
##D   patchCode()
## End(Not run)


