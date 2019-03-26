library(HH)


### Name: HHscriptnames
### Title: Find absolute pathname of a script file for the HH book in the
###   HH package.
### Aliases: HHscriptnames WindowsPath
### Keywords: misc

### ** Examples

## Not run: 
##D   ## All Operating Systems
##D 
##D   ## Second Edition
##D   HHscriptnames()
##D   HHscriptnames(6)
##D   HHscriptnames("6")
##D   HHscriptnames("oway")
##D 
##D   HHscriptnames("H")
##D   HHscriptnames("RApx")
##D 
##D   HHscriptnames(c(1:18, LETTERS[1:15]))
##D 
##D   ## with Windows pathname separators
##D   WindowsPath(HHscriptnames())
##D   WindowsPath(HHscriptnames(6))
##D   WindowsPath(HHscriptnames(6), display=FALSE)
##D   WindowsPath(HHscriptnames(6:8))
##D   WindowsPath(HHscriptnames(6:8), display=FALSE)
##D 
##D   ## First Edition
##D   HHscriptnames(6, edition=1)
## End(Not run)



