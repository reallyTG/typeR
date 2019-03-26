library(ClustBlock)


### Name: cluscata
### Title: Perform a cluster analysis of blocks of binary variables from a
###   CATA experiment
### Aliases: cluscata
### Keywords: CATA

### ** Examples

## Not run: 
##D data(straw)
##D res=cluscata(Data=straw[,1:(16*40)], nblo=40)
##D plot(res, ngroups=3, Graph_dend=FALSE)
##D summary(res, ngroups=3)
##D #With noise cluster
##D res2=cluscata(Data=straw[,1:(16*40)], nblo=40, Noise_cluster=TRUE,
##D Graph_dend=FALSE, Graph_bar=FALSE)
## End(Not run)




