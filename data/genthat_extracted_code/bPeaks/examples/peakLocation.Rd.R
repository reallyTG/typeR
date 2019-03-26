library(bPeaks)


### Name: peakLocation
### Title: Function to locate detected basic peaks (bPeaks) according to
###   predifined chromosomal features
### Aliases: peakLocation

### ** Examples

## Not run: 
##D # -> bPeaks analysis with (all chromosome and default parameters optimized for yeasts)
##D 
##D # STEP 1: get PDR1 data and annotations in yeasts
##D data(dataPDR1)
##D data(yeastCDS)
##D 
##D # STEP 2: bPeaks analysis
##D bPeaksAnalysis(IPdata = dataPDR1$IPdata, 
##D                controlData = dataPDR1$controlData, 
##D                windowSize = 150, windowOverlap = 50, 
##D                IPcoeff = 6, controlCoeff = 4, 
##D                log2FC = 2, averageQuantiles = 0.9,
##D                resultName = "bPeaks_PDR1", 
##D                peakDrawing = TRUE)
##D 
##D # STEP 3 : procedure to locate peaks according to 
##D # predefined chromosomal features
##D peakLocation(bedFile = "bPeaks_PDR1_bPeaks_allGenome.bed", 
##D             cdsPositions = yeastCDS$Saccharomyces.cerevisiae,
##D 	    withoutOverlap = FALSE,
##D             outputName = "bPeakLocation_finalPDR1", promSize = 800)
## End(Not run)



