library(MSnbase)


### Name: plotMzDelta-methods
### Title: The delta m/z plot
### Aliases: plotMzDelta-methods plotMzDelta,MSnExp-method
###   plotMzDelta,mzRramp-method plotMzDelta
### Keywords: methods

### ** Examples

mzdplot <- plotMzDelta(itraqdata,
                       subset = 0.5,
                       reporters = iTRAQ4,
                       verbose = FALSE, plot = FALSE)
## let's retrieve peptide sequence information
## and get a table of amino acids
peps <- as.character(fData(itraqdata)$PeptideSequence)
aas <- unlist(strsplit(peps,""))
## table of aas
table(aas)
## mzDelta plot
print(mzdplot)



