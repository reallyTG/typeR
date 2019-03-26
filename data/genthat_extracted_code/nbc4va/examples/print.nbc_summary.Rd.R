library(nbc4va)


### Name: print.nbc_summary
### Title: Print top predicted causes from a NBC model
### Aliases: print.nbc_summary

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Print a summary of all the test data for the top 3 causes by predicted CSMF
brief <- summary(results, top=3)
print(brief)




