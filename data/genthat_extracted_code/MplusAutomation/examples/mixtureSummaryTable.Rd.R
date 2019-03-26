library(MplusAutomation)


### Name: mixtureSummaryTable
### Title: Create a summary table of Mplus mixture models
### Aliases: mixtureSummaryTable
### Keywords: mixture mplus

### ** Examples

## Not run: 
##D createMixtures(classes = 1:3, filename_stem = "iris", rdata = iris)
##D runModels(filefilter = "iris")
##D results <- readModels(filefilter = "iris")
##D mixtureSummaryTable(results)
##D createMixtures(classes = 1:3, filename_stem = "iris", rdata = iris,
##D                OUTPUT = "tech11 tech14;")
##D runModels(filefilter = "iris", replaceOutfile = "modifiedDate")
##D results <- readModels(filefilter = "iris")[c(1:2)]
##D mixtureSummaryTable(results)
## End(Not run)



