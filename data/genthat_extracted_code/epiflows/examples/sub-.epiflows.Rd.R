library(epiflows)


### Name: [.epiflows
### Title: Subset 'epiflows' objects
### Aliases: [.epiflows

### ** Examples

data(Brazil_epiflows)
# You can subset, but the flows information will still be present
Brazil_epiflows[j = "Espirito Santo"]
# To help with this, use `thin` from epiflows
epicontacts::thin(Brazil_epiflows[j = "Espirito Santo"])
epicontacts::thin(Brazil_epiflows[j = c("Espirito Santo", "Rio de Jenerio")])




