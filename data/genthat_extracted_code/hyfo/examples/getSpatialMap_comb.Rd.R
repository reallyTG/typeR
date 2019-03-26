library(hyfo)


### Name: getSpatialMap_comb
### Title: Combine maps together
### Aliases: getSpatialMap_comb

### ** Examples



## Not run: 
##D data(tgridData)# the result of \code{loadNcdf}
##D #The output should be 'ggplot'
##D a1 <- getSpatialMap(tgridData, method = 'summer', output = 'ggplot', name = 'a1')
##D a2 <- getSpatialMap(tgridData, method = 'winter', output = 'ggplot', name = 'a2')
##D a3 <- getSpatialMap(tgridData, method = 'mean', output = 'ggplot', name = 'a3')
##D a4 <- getSpatialMap(tgridData, method = 'max', output = 'ggplot', name = 'a4')
##D getSpatialMap_comb(a1, a2)
##D 
##D # or you can put them into a list.
##D getSpatialMap_comb(list = list(a1, a2), nrow = 2)
## End(Not run)



# More examples can be found in the user manual on https://yuanchao-xu.github.io/hyfo/




