library(stemmatology)


### Name: PCC.elimination
### Title: PCC Exploratory Methods: Elimination of Over-Conflicting Variant
###   Locations
### Aliases: PCC.elimination
### Keywords: stemmatology

### ** Examples

# Load data
data("fournival")
# Analyse its conflicts
myConflicts = PCC.conflicts(fournival)
## Not run: 
##D # Interactive mode: identify over-conflicting VL
##D PCC.overconflicting(myConflicts)
## End(Not run)
# Non interactive mode
myConflicts = PCC.overconflicting(myConflicts, ask = FALSE, threshold = 0.06)
# Create a new DB without problematic VL
myNewDB = PCC.elimination(myConflicts)



