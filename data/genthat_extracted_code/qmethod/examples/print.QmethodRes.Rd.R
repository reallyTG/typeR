library(qmethod)


### Name: print.QmethodRes
### Title: Q Method: print method for results
### Aliases: print.QmethodRes
### Keywords: print

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
print(results, length = 5, digits = 1)



