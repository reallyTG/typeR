library(likeLTD)


### Name: read.peaks.profile
### Title: likeLTD::read.peaks.profile
### Aliases: read.peaks.profile

### ** Examples

## Not run: 
##D # datapath to example files
##D datapath = file.path(system.file("extdata", package="likeLTD"),"laboratory")
##D 
##D # File paths and case name for allele report
##D admin = pack.admin.input.peaks(
##D             peaksFile = file.path(datapath, 'laboratory-CSP.csv'),
##D             refFile = file.path(datapath, 'laboratory-reference.csv'),
##D             caseName = "Laboratory",
##D             detectionThresh = 20
##D              )
##D 
##D # read csp
##D csp = read.peaks.profile(admin$peaksFile)
## End(Not run)



