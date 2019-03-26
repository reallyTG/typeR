library(stemmatology)


### Name: PCC.Stemma
### Title: PCC.Stemma: Building the Stemma Codicum
### Aliases: PCC.Stemma
### Keywords: stemmatology

### ** Examples

# Load data
data("parzival")
# or alternatively, import it
#fournival = import.TEIApparatus(file = "myFournival.xml", 
#                      appTypes = c("substantive"))
## Not run: 
##D # Interactive mode
##D # Analyse it with the PCC functions
##D myDBs = PCC.Exploratory(parzival)
##D # draw a stemma
##D PCC.Stemma(myDBs$databases[[2]])
## End(Not run)
## Don't show: 
# subsetting for exec time
parzival = parzival[1:100,c(-6,-8,-12,-13,-14)]
## End(Don't show)
# Non interactive mode
myDBs = PCC.Exploratory(parzival, ask = FALSE, threshold = 0.06)
PCC.Stemma(myDBs$databases[[2]], ask = FALSE)



