library(openCR)


### Name: dipperCH
### Title: Dippers
### Aliases: dipperCH
### Keywords: datasets

### ** Examples


m.array(dipperCH)

## Not run: 
##D 
##D # From file 'ed.inp' in MARK input format
##D datadir <- system.file('extdata', package = 'openCR')
##D dipperCH <- read.inp(paste0(datadir, '/ed.inp'), grouplabel='sex',
##D     grouplevels = c('Male','Female'))
##D intervals(dipperCH) <- rep(1,6)    
##D sessionlabels(dipperCH) <- 1981:1987   # labels only
##D 
##D # or extracted from the RMark package with this code
##D if (require(RMark)) {
##D     if (all (nchar(Sys.which(c('mark.exe','mark64.exe', 'mark32.exe'))) < 2))
##D         stop ("MARK executable not found; set e.g. MarkPath <- 'c:/Mark/'")
##D     data(dipper)                       # retrieve dataframe of dipper capture histories
##D     dipperCH2 <- unRMarkInput(dipper)  # convert to secr capthist object
##D     intervals(dipperCH2) <- rep(1,6)    
##D     sessionlabels(dipperCH2) <- 1981:1987   # labels only
##D } else message ("RMark not found")
##D 
##D # The objects dipperCH and dipperCH2 differ in the order of factor levels for 'sex'
## End(Not run)




