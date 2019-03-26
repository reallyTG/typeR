library(missMDA)


### Name: plot.MIMCA
### Title: Plot the graphs for the Multiple Imputation in MCA
### Aliases: plot.MIMCA
### Keywords: dplot

### ** Examples

## Not run: 
##D data(TitanicNA)
##D 
##D ## First the number of components has to be chosen 
##D ##   (for the reconstruction step)
##D ## nb <- estim_ncpMCA(TitanicNA) ## Time-consuming, nb = 5
##D 
##D ## Multiple Imputation
##D res.mi <- MIMCA(TitanicNA, ncp=5, verbose=TRUE)
##D 
##D ## Plot the graphs
##D plot(res.mi)
## End(Not run)



