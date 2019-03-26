library(stemmatology)


### Name: stemmatology
### Title: An R Stemmatology Package
### Aliases: stemmatology-package
### Keywords: stemmatology

### ** Examples


# Load data
data(fournival)
# or alternatively, import it
#fournival = import.TEIApparatus(file = "myFournival.xml", 
#    appTypes = c("substantive"))

## Not run: 
##D # Interactive mode
##D 
##D # Analyse it with the PCC functions
##D PCC(fournival)
## End(Not run)

# Complete step-by-step non interactive use
data("fournival")
## Don't show: 
# subsetting for exec time
fournival = fournival[1:200,c(-5,-8)]
## End(Don't show)
# look for conflicts
myConflicts = PCC.conflicts(fournival)
# remove conflicting VL
myConflicts = PCC.overconflicting(myConflicts, ask = FALSE, threshold = 0.06)
myNewData = PCC.elimination(myConflicts)
# look for competing genealogies
myConflicts = PCC.conflicts(myNewData)
myNewData = PCC.equipollent(myConflicts, ask = FALSE, scope = "W", wits = "D")
# build a stemma
PCC.Stemma(myNewData$databases[[1]], ask = FALSE)



