library(likeLTD)


### Name: optimisation.params.peaks
### Title: likeLTD::optimisation.params.peaks
### Aliases: optimisation.params.peaks

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
##D 
##D # Get parameters for optimisation
##D paramsP = optimisation.params.peaks(hypP)
##D paramsD = optimisation.params.peaks(hypD)
##D 
##D # parameters without linkage adjustment
##D paramsP = optimisation.params.peaks(hypP,doLinkage=FALSE)
## End(Not run)



