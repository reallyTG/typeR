library(stemmatology)


### Name: PCC.equipollent
### Title: PCC Exploratory Methods: Extracting Competing Genealogies
### Aliases: PCC.equipollent
### Keywords: stemmatology manip

### ** Examples

# load data
data("fournival")
## No test: 
# look for conflicts
y = PCC.conflicts(fournival)
# identify and eliminate overconflicting VL
y = PCC.overconflicting(y, ask = FALSE, threshold = 0.06)
y = PCC.elimination(y)
# look for further conflicts
y = PCC.conflicts(y)
## End(No test)
## Don't show: 
# subsetting for time gain
y = fournival[1:25,]
y = PCC.conflicts(y)
## End(Don't show)
# and now, create configurations for competing genealogies
# for instance, for one witness
newDB = PCC.equipollent(y, ask = FALSE, scope = "W", wits = "D")

# Alternatively, you can create them for the whole tradition
newDB = PCC.equipollent(y, ask = FALSE, scope = "T")
# or for several witnesses
newDB = PCC.equipollent(y, ask = FALSE, scope = "W", wits = c("A", "D"))

# and then you proceed to create one or several stemmata, e.g.
# PCC.Stemma(newDB$databases[[1]], ask = FALSE)



