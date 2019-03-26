library(stemmatology)


### Name: PCC.conflicts
### Title: PCC Exploratory Methods: Conflicts between Variant Locations
### Aliases: PCC.conflicts
### Keywords: stemmatology

### ** Examples

# Load data
data(fournival)
## Don't show: 
# subsetting for time gain
fournival = fournival[1:25,]
## End(Don't show) 
# Analyse its conflicts
myConflicts = PCC.conflicts(fournival)



