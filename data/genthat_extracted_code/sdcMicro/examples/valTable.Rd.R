library(sdcMicro)


### Name: valTable
### Title: Comparison of different microaggregation methods
### Aliases: valTable
### Keywords: print

### ** Examples


data(Tarragona)
## Not run: 
##D valTable(Tarragona[100:200,],
##D method=c("simple","onedims","pca","addNoise: additive"))
##D valTable(Tarragona,
##D method=c("simple","onedims","pca","clustpppca",
##D "mdav", "addNoise: additive", "swappNum"))
##D ## clustpppca in combination with Mclust outperforms
##D ## the other algorithms for this data set...
## End(Not run)



