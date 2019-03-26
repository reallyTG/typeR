library(ROI.models.netlib)


### Name: netlib
### Title: Obtain Netlib Linear Problems
### Aliases: netlib

### ** Examples

## Not run: 
##D   library(ROI)
##D   library(ROI.models.netlib)
##D   ## list all available problems
##D   netlib()
##D   ## get all problems as a list
##D   ntlb <- netlib("all")
##D   ## get a certain problem by name
##D   netlib("afiro")
##D   ntlb[["afiro"]]
##D   ## get the meta info to the problems
##D   netlib("metainfo")
##D   ## solve a problem
##D   sol <- ROI_solve(netlib("afiro"))
##D   sol
##D   sol$objval - as.numeric(netlib("metainfo")["afiro", "final_results"])
## End(Not run)



