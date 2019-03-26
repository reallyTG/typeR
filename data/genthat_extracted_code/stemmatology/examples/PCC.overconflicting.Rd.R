library(stemmatology)


### Name: PCC.overconflicting
### Title: PCC Exploratory Methods: Identification of Over-Conflicting
###   Variant Locations
### Aliases: PCC.overconflicting
### Keywords: stemmatology

### ** Examples

# Load data
data("fournival")
## Don't show: 
# subsetting for time gain
fournival = fournival[1:25,]
## End(Don't show)
# Analyse its conflicts
myConflicts = PCC.conflicts(fournival)
## Not run: 
##D # Interactive mode: identify over-conflicting VL
##D PCC.overconflicting(myConflicts)
## End(Not run)
# Non interactive mode
PCC.overconflicting(myConflicts, ask = FALSE, threshold = 0.06)



