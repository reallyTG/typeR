library(stemmatology)


### Name: PCC
### Title: PCC (Poole-Camps-Cafiero) stemmatological method
### Aliases: PCC
### Keywords: stemmatology

### ** Examples

# Load data
data("fournival")
# or alternatively, import it
# fournival = import.TEIApparatus(file = "myFournival.xml", 
#    appTypes = c("substantive"))

# Analyse it with the PCC functions
## Don't show: 
# subsetting for exec time
fournival = fournival[40:200,c(-5,-7,-8)]
## End(Don't show)
# Non interactive mode
PCC(fournival, ask = FALSE, threshold = 0.06)

## Not run: 
##D # Interactive mode
##D PCC(fournival)
## End(Not run)




