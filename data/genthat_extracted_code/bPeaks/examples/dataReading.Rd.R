library(bPeaks)


### Name: dataReading
### Title: Function to import sequencing results in R
### Aliases: dataReading
### Keywords: data reading

### ** Examples

# get library
library(bPeaks)

## Not run: 
##D # Sequencing result files associated to PDR1 datasets (IP and control files) 
##D # can be downloaded from our website http://bpeaks.gene-networks.net/. 
##D # They are respectively named "IP_genomeCoverage.txt" (IP sample) and 
##D # "INPUT_genomeCoverage.txt" (control sample).
##D 
##D # Import in R the sequencing results using S. cerevisiae CDS annotations.
##D data(yeastCDS)
##D seqResult = dataReading("IP_genomeCoverage.txt", "INPUT_genomeCoverage.txt",
##D 			yeastSpecies = yeastCDS$Saccharomyces.cerevisiae)
##D 
##D # IP data
##D seqResult$IPdata
##D 
##D # control data
##D seqResult$controlData
##D 
##D # run peak detection from IP and control data (with default parameters)
##D bPeaksAnalysis(IPdata = seqResult$IPdata, 
##D 	       controlData  = seqResult$controlData,
##D 	       cdsPositions = seqResult$cdsPositions)
## End(Not run)



