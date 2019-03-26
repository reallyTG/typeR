library(ShinyItemAnalysis)


### Name: plotDistractorAnalysis
### Title: Function for graphical representation of item distractor
###   analysis
### Aliases: plotDistractorAnalysis

### ** Examples

## Not run: 
##D # loading 100-item medical admission test data
##D data(dataMedicaltest, dataMedicalkey)
##D dataBin <- dataMedical[, 1:100]
##D data <- dataMedicaltest[, 1:100]
##D key <- unlist(dataMedicalkey)
##D 
##D # Difficulty/Discriminaton plot for medical admission test
##D DDplot(dataBin)
##D # item 48 is very hard, thus does not discriminate well
##D # item 57 discriminates well
##D # item 32 does not discriminate well
##D 
##D plotDistractorAnalysis(data, key, item = 48, multiple.answers = F)
##D # correct answer B does not function well
##D plotDistractorAnalysis(data, key, item = 57, multiple.answers = F)
##D # all options function well, thus the whole item discriminates well
##D plotDistractorAnalysis(data, key, item = 32, multiple.answers = F)
##D # functions well, thus the whole item discriminates well
##D 
##D # distractor analysis plot for item 48, 57 and 32, all combinations
##D plotDistractorAnalysis(data, key, item = 48)
##D plotDistractorAnalysis(data, key, item = 57)
##D plotDistractorAnalysis(data, key, item = 32)
##D 
##D # distractor analysis plot for item 57, all combinations and 6 groups
##D plotDistractorAnalysis(data, key, num.group = 6, item = 57)
## End(Not run)





