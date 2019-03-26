library(EGRET)


### Name: stitch
### Title: stitch surfaces
### Aliases: stitch

### ** Examples

eList <- Choptank_eList

surfaceStart <- "1986-10-01"
surfaceEnd <- "2010-09-30"

# Surface skips a few years:
sample1StartDate <- "1986-10-01"
sample1EndDate <- "1992-09-30"
sample2StartDate <- "1996-10-01"
sample2EndDate <- "2011-09-30"

## Not run: 
##D surface_skip <- stitch(eList, 
##D                          sample1StartDate, sample1EndDate, 
##D                          sample2StartDate, sample2EndDate,
##D                          surfaceStart, surfaceEnd)
##D 
##D # Surface overlaps a few years:
##D sample1StartDate <- "1986-10-01"
##D sample1EndDate <- "1996-09-30"
##D sample2StartDate <- "1992-10-01"
##D sample2EndDate <- "2011-09-30"
##D 
##D surface_overlap <- stitch(eList, 
##D                          sample1StartDate, sample1EndDate, 
##D                          sample2StartDate, sample2EndDate)
## End(Not run)



