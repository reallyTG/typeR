library(erah)


### Name: findComp
### Title: Find a Compound
### Aliases: findComp

### ** Examples


# finding proline

findComp("proline")

# be careful, exact matches are not supported, 
# as well as special cases of partial searches, like these cases:

findComp("L-proline (2TMS)")

findComp("proline 2")

# which will not report any results despite being in the database



