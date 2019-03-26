library(bPeaks)


### Name: bPeaksAnalysis
### Title: Function to run the entire bPeaks procedure
### Aliases: bPeaksAnalysis
### Keywords: peak calling ChIP-seq protein binding sites protein-DNA
###   interactions deep sequencing

### ** Examples

# get library
library(bPeaks)

# STEP 1: get PDR1 data
data(dataPDR1)

# STEP 2 : bPeaks analysis (only 10 kb of chrIV are analyzed here, 
#          as an illustration)
bPeaksAnalysis(IPdata = dataPDR1$IPdata[40000:50000,], 
               controlData = dataPDR1$controlData[40000:50000,], 
               windowSize = 150, windowOverlap = 50, 
               IPcoeff = 4, controlCoeff = 2, log2FC = 1, 
               averageQuantiles = 0.5,
               resultName = "bPeaks_example", 
               peakDrawing = TRUE, promSize = 800)

## Not run: 
##D # STEP 2 : bPeaks analysis (all chromosome)
##D bPeaksAnalysis(IPdata = dataPDR1$IPdata, controlData = dataPDR1$controlData, 
##D                 cdsPositions = dataPDR1$cdsPositions, 
##D                 smoothingValue = c(20), 
##D                 windowSize = c(150), windowOverlap = 50, 
##D                 IPcoeff = c(2), controlCoeff = c(2), log2FC = c(2), 
##D                 averageQuantiles = c(0.9),
##D                 resultName = "bPeaks_PDR1_chr4", 
##D                 peakDrawing = TRUE, promSize = 800)
##D 
##D # To repeat the bPeaks analysis with different parameters
##D bPeaksAnalysis(IPdata = dataPDR1$IPdata, controlData = dataPDR1$controlData, 
##D                 cdsPositions = dataPDR1$cdsPositions, 
##D                 smoothingValue = c(20), 
##D                 windowSize = c(150), windowOverlap = 50, 
##D                 IPcoeff = c(2, 4, 6), controlCoeff = c(2, 4, 6), log2FC = c(2, 3), 
##D                 averageQuantiles = c(0.7, 0.9),
##D                 resultName = "bPeaks_PDR1_chr4_paremeterEval", 
##D                 peakDrawing = FALSE, promSize = 800)
##D 
##D # -> Summary table is created and saved as "peakStats.Robject" in the working directory
##D # as well as a text file named "_bPeaks_parameterSummary.txt"...
##D load("peakStats.Robject")
##D # This table comprises different information regarding peak detection (number of peaks,
##D # mean size of peaks, mean IP signal, mean control signal, etc.)
##D peakStats[1:2,]
##D 
##D #     smoothingValue windowSize windowOverlap IPcoeff controlCoeff log2FC
##D # [1,]             20        150            50       1            1      1
##D # [2,]             20        150            50       1            1      1
##D #     averageQuantiles bPeakNumber meanSize meanIPsignal meanControlSignal
##D # [1,]              0.5         308  209.091      276.047            71.534
##D # [2,]              0.7         294  205.782      287.808            74.002
##D #     meanLog2FC bPeakNumber_beforeFeatures bPeakNumber_afterFeatures
##D # [1,]      1.571                         99                        80
##D # [2,]      1.589                         94                        77
##D #     bPeakNumber_inFeatures
##D # [1,]                     52
##D # [2,]                     53
##D 
## End(Not run)



