library(likeLTD)


### Name: read.known.profiles
### Title: likeLTD::read.known.profiles
### Aliases: read.known.profiles

### ** Examples

## Not run: 
##D ######################
##D # Peak heights model #
##D ######################
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
##D # get reference profiles
##D read.known.profiles(admin$refFile)
##D 
##D ##################
##D # Discrete model #
##D ##################
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
##D # get reference profiles
##D read.known.profiles(admin$refFile)
## End(Not run)



