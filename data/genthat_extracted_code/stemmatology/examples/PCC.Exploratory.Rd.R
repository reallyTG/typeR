library(stemmatology)


### Name: PCC.Exploratory
### Title: PCC Exploratory methods
### Aliases: PCC.Exploratory
### Keywords: stemmatology

### ** Examples

# Load data
data(fournival)
## Not run: 
##D # Interactive mode
##D # or alternatively, import it
##D #fournival = import.TEIApparatus(file = "myFournival.xml", 
##D #                      appTypes = c("substantive"))
##D # Analyse it with the PCC functions
##D PCC.Exploratory(fournival)
## End(Not run)
## Don't show: 
# subsetting for exec time
fournival = fournival[1:50,c(-5,-8)]
## End(Don't show)
# Non interactive mode
PCC.Exploratory(fournival, ask = FALSE, threshold = 0.06)



