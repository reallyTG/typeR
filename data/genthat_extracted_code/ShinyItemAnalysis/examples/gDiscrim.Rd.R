library(ShinyItemAnalysis)


### Name: gDiscrim
### Title: Generalized Item Discrimination
### Aliases: gDiscrim

### ** Examples

## Not run: 
##D # loading 100-item medical admission test data sets
##D data(dataMedical, dataMedicalgraded)
##D # binary data set
##D dataBin <- dataMedical[, 1:100]
##D # ordinal data set
##D dataOrd <- dataMedicalgraded[, 1:100]
##D 
##D # ULI for first 5 items for binary data set
##D # compare to psychometric::discrim(x)
##D gDiscrim(dataBin)[1:5]
##D # generalized ULI using 5 groups, compare 4th and 5th for binary data set
##D gDiscrim(dataBin, k = 5, l = 4, u = 5)[1:5]
##D 
##D # ULI for first 5 items for ordinal data set
##D gDiscrim(dataOrd)[1:5]
##D # generalized ULI using 5 groups, compare 4th and 5th for binary data set
##D gDiscrim(dataOrd, k = 5, l = 4, u = 5)[1:5]
##D # maximum (4) and minimum (0) score are same for all items
##D gDiscrim(dataOrd,  k = 5, l = 4, u = 5, maxscore = 4, minscore = 0)[1:5]
## End(Not run)



