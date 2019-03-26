library(qmethod)


### Name: loa.and.flags
### Title: Q methodology: show factor loadings next to flags
### Aliases: loa.and.flags

### ** Examples

data(lipset)
results <- qmethod(lipset[[1]], nfactors = 3, rotation = "varimax")
loa.and.flags(results)



