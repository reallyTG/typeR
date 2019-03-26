library(EEM)


### Name: plotLoading
### Title: Plot loadings for EEM data
### Aliases: plotLoading

### ** Examples

data(applejuice)
applejuice_uf <- unfold(applejuice) # unfold list into matrix
result <- prcomp(applejuice_uf) 
plotLoading(result, ncomp = 1) # plot loading of the first PC
 



