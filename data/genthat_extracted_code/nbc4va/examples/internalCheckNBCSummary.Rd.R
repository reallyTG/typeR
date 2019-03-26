library(nbc4va)


### Name: internalCheckNBCSummary
### Title: Check arguments for summary.nbc()
### Aliases: internalCheckNBCSummary
### Keywords: internal

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Create an nbc
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Check the inputs before passing on to summary
checked <- nbc4va:::internalCheckNBCSummary(results, 5, "g85")
results <- checked$object
top <- checked$top
id <- checked$id
csmfa.obs <- checked$csmfa.obs




