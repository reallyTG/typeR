library(likeLTD)


### Name: allele.report.peaks
### Title: likeLTD::allele.report.peaks
### Aliases: allele.report.peaks

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
##D # generate allele report
##D allele.report.peaks(admin)
## End(Not run)



