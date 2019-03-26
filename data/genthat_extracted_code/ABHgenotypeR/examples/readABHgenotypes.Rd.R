library(ABHgenotypeR)


### Name: readABHgenotypes
### Title: Read in the output of the genosToABH plugin.
### Aliases: readABHgenotypes

### ** Examples

## Not run: genotypes <- readABHgenotypes("./genotypes.csv", "NB", "OL")

 ## Not run: otherGenotypes <- readABHgenotypes("./otherGenotypes.csv", readPos = FALSE)
 #arbitrary position to keep marker order intact
 ## Not run: therGenotypes$pos <- 1:length(otherGenotypes$marker_names)



