library(ShinyItemAnalysis)


### Name: ItemAnalysis
### Title: Item Analysis
### Aliases: ItemAnalysis

### ** Examples

## Not run: 
##D # loading 100-item medical admission test data sets
##D data(dataMedical, dataMedicalgraded)
##D # binary data set
##D dataBin <- dataMedical[, 1:100]
##D # ordinal data set
##D dataOrd <- dataMedicalgraded[, 1:100]
##D # study success is the same for both data sets
##D StudySuccess <- dataMedical[, 102]
##D 
##D # item analysis for binary data
##D head(ItemAnalysis(dataBin))
##D # item analysis for binary data using also study success
##D head(ItemAnalysis(dataBin, y = StudySuccess))
##D 
##D # item analysis for binary data
##D head(ItemAnalysis(dataOrd))
##D # item analysis for binary data using also study success
##D head(ItemAnalysis(dataOrd, y = StudySuccess))
##D # including also item analysis for binarized data
##D head(ItemAnalysis(dataOrd, y = StudySuccess, k = 5, l = 4, u = 5,
##D maxscore = 4, minscore = 0, cutscore = 4, add.bin = TRUE) )
## End(Not run)



