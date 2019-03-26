library(ShinyItemAnalysis)


### Name: DDplot
### Title: Graphical representation of difficulty and (generalized)
###   discrimination in item analysis
### Aliases: DDplot

### ** Examples

## Not run: 
##D # loading 100-item medical admission test data sets
##D data(dataMedical, dataMedicalgraded)
##D # binary data set
##D dataBin <- dataMedical[, 1:100]
##D # ordinal data set
##D dataOrd <- dataMedicalgraded[, 1:100]
##D 
##D # DDplot of binary data set
##D DDplot(dataBin)
##D # compared to DDplot using ordinal data set and 'bin = TRUE'
##D DDplot(dataOrd, bin = TRUE)
##D # compared to binarized data set using bin = TRUE and cutscore equal to 3
##D DDplot(dataOrd, bin = TRUE, cutscore = 3)
##D 
##D # DDplot of binary data using generalized ULI
##D # discrimination based on 5 groups, comparing 4th and 5th
##D DDplot(dataBin, k = 5, l = 4, u = 5)
##D 
##D # DDplot of ordinal data set using ULI
##D DDplot(dataOrd)
##D # DDplot of ordinal data set using generalized ULI
##D # discrimination based on 5 groups, comparing 4th and 5th
##D DDplot(dataOrd, k = 5, l = 4, u = 5)
##D # DDplot of ordinal data set using RIT
##D DDplot(dataOrd, discrim = "RIT")
##D # DDplot of ordinal data set using RIR
##D DDplot(dataOrd, discrim = "RIR")
## End(Not run)



