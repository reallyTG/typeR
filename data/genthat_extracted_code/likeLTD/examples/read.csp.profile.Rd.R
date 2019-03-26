library(likeLTD)


### Name: read.csp.profile
### Title: likeLTD::read.csp.profile
### Aliases: read.csp.profile

### ** Examples

## Not run: 
##D # datapath to example files
##D datapath = file.path(system.file("extdata", package="likeLTD"),"hammer")
##D 
##D # File paths and case name for allele report
##D admin = pack.admin.input(
##D             cspFile = file.path(datapath, 'hammer-CSP.csv'),
##D             refFile = file.path(datapath, 'hammer-reference.csv'),
##D             caseName = "hammer",
##D 	    kit= "SGMplus"
##D              )
##D 
##D # get CSP
##D read.csp.profile(admin$cspFile)
## End(Not run)



