library(bPeaks)


### Name: bPeaks-package
### Title: bPeaks: an intuitive peak-calling strategy to detect
###   transcription factor binding sites from ChIP-seq data in small
###   eukaryotic genomes
### Aliases: bPeaks-package bPeaks
### Keywords: peak calling ChIP-seq protein binding sites protein-DNA
###   interactions deep sequencing small eukaryotic genomes

### ** Examples

# get library
library(bPeaks)

# STEP 1: get PDR1 data (ChIP-seq experiments, IP and control samples, 
# 	related to the transcription factor Pdr1 in yeast Saccharomyces 
# 	cerevisiae) 
data(dataPDR1)

# STEP 2 : bPeaks analysis (only 10 kb of chrIV are analyzed here, 
#          as an illustration)
bPeaksAnalysis(IPdata = dataPDR1$IPdata[40000:50000,], 
               controlData  = dataPDR1$controlData[40000:50000,], 
	       cdsPositions = dataPDR1$cdsPositions,
               windowSize = 150, windowOverlap = 50, 
               IPcoeff = 4, controlCoeff = 2, 
	       log2FC  = 1, averageQuantiles = 0.5,
               resultName = "bPeaks_example")

# --> Result files (PDF and BED) are written in the working directory.

## Not run: 
##D # -> bPeaks analysis, all chromosome IV and default parameters (optimized for yeasts)
##D 
##D # STEP 1: get PDR1 data (ChIP-seq experiments, IP and control samples, 
##D # 	related to the transcription factor Pdr1 in yeast Saccharomyces 
##D # 	cerevisiae) 
##D data(dataPDR1)
##D 
##D # STEP 2: bPeaks analysis
##D bPeaksAnalysis(IPdata = dataPDR1$IPdata, 
##D                controlData  = dataPDR1$controlData,
##D 	       cdsPositions = dataPDR1$cdsPositions, 
##D                windowSize = 150, windowOverlap = 50, 
##D                IPcoeff = 2, controlCoeff = 2, 
##D                log2FC = 2, averageQuantiles = 0.9,
##D                resultName = "bPeaks_PDR1", 
##D                peakDrawing = TRUE)
##D 
##D # STEP 3 : procedure to locate peaks according to 
##D # 	   gene positions
##D peakLocation(bedFile = "bPeaks_PDR1_bPeaks_allGenome.bed", 
##D             cdsPositions = yeastCDS$Saccharomyces.cerevisiae,
##D             outputName = "bPeakLocation_finalPDR1", promSize = 800)
##D 
##D # -> Note that cds (genes) positions are stored in bPeaks package for several yeast
##D # species
##D data(yeastCDS)
##D 
##D summary(yeastCDS)
##D #                         Length Class      Mode     
##D # Debaryomyces.hansenii    31370  -none-     character
##D # Eremothecium.gossypii    23615  -none-     character
##D # Kluyveromyces.lactis     25380  -none-     character
##D # Pichia.sorbitophila      55875  -none-     character
##D # Saccharomyces.kluyveri   27790  -none-     character
##D # Yarrowia.lipolytica      32235  -none-     character
##D # Zygosaccharomyces.rouxii 24955  -none-     character
##D # Saccharomyces.cerevisiae     5  data.frame list     
##D # Candida.albicans             5  data.frame list     
##D # Candida.glabrata             5  data.frame list
## End(Not run)




