library(likeLTD)


### Name: CSP.heights.plot
### Title: likeLTD::CSP.heights.plot
### Aliases: CSP.heights.plot

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
##D # plot CSP heights
##D CSP.heights.plot(csp=read.peaks.profile(admin$peaksFile),
##D 		ref=read.known.profiles(admin$refFile))
##D 
##D # to plot just the first four loci
##D CSP.heights.plot(csp=read.peaks.profile(admin$peaksFile),
##D 		ref=read.known.profiles(admin$refFile),
##D 		toplot=1:4)
##D 
##D # to estimate which peaks are non-allelic
##D CSP.heights.plot(csp=read.peaks.profile(admin$peaksFile),
##D 		ref=read.known.profiles(admin$refFile),
##D 		doStutter=TRUE)
##D 
##D # to display detection threshold
##D CSP.heights.plot(csp=read.peaks.profile(admin$peaksFile),
##D 		ref=read.known.profiles(admin$refFile),
##D 		detectThresh=20)
## End(Not run)



