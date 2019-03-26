library(mpmcorrelogram)


### Name: mpmcorrelogram
### Title: Multivariate Partial Mantel Correlogram
### Aliases: mpmcorrelogram print.mpmcorrelogram plot.mpmcorrelogram
### Keywords: spatial multivariate

### ** Examples

 # Example from Figure 13.12 of Legendre and Legendre (1998):

 # Get similarity matrix based on assemblage composition.
 
 data(S) 
 
 # Get euclidean distance between sites.
 
 data(D)
 
 # Compute Multivariate Mantel Correlogram
 # as in Fig. 13.12 of Legendre and Legendre
 
 ## Not run: 
##D  result <- mpmcorrelogram(S, D, simil=TRUE)
##D  
## End(Not run)
 ## Don't show: 
 result <- mpmcorrelogram(S,D, simil=TRUE,permutations=4)
 
## End(Don't show)
 
 # A Multivariate Partial examle.
 # Get distance matrix of "covariate" attributes
 
 data(Zd)
 
 # Compute multivariate partial Mantel correlogram
 
 ## Not run: 
##D  result <- mpmcorrelogram(S, D, Zd, simil=TRUE)
##D  
## End(Not run)
 ## Don't show: 
 result <- mpmcorrelogram(S, D, Zd, simil=TRUE, permutations=4)
 
## End(Don't show)

# Change the appearance of the plot
 
 ## Not run: 
##D  plot(result, pch=c(17,24))
##D  
## End(Not run)



