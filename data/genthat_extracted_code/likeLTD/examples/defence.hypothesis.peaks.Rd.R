library(likeLTD)


### Name: defence.hypothesis.peaks
### Title: likeLTD::defence.hypothesis.peaks
### Aliases: defence.hypothesis.peaks

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
##D # Enter arguments
##D args = list(
##D         nUnknowns = 1
##D         )
##D 
##D # Create hypotheses
##D hypP = do.call(prosecution.hypothesis.peaks, append(admin,args))
##D hypD = do.call(defence.hypothesis.peaks, append(admin,args))
## End(Not run)



