library(ShinyItemAnalysis)


### Name: DistractorAnalysis
### Title: Function for item distractor analysis
### Aliases: DistractorAnalysis

### ** Examples

## Not run: 
##D # loading 100-item medical admission test data
##D data(dataMedicaltest, dataMedicalkey)
##D data <- dataMedicaltest[, 1:100]
##D key <- unlist(dataMedicalkey)
##D 
##D # distractor analysis for dataMedicaltest data set
##D DistractorAnalysis(data, key)
##D 
##D # distractor analysis for dataMedicaltest data set with proportions
##D DistractorAnalysis(data, key, p.table = T)
##D 
##D # distractor analysis for dataMedicaltest data set for 6 groups
##D DistractorAnalysis(data, key, num.group = 6)
## End(Not run)





