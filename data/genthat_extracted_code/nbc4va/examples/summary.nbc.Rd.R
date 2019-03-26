library(nbc4va)


### Name: summary.nbc
### Title: Summarize a NBC model with metrics
### Aliases: summary.nbc

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Obtain a summary for the results
brief <- summary(results, top=2)  # top 2 causes by CSMF for all test data
briefID <- summary(results, id="v48")  # top 5 causes by probability for case "v48"




