library(nbc4va)


### Name: plot.nbc
### Title: Bar plot of top predicted causes from a NBC model
### Aliases: plot.nbc

### ** Examples

library(nbc4va)
data(nbc4vaData)

# Run naive bayes classifier on random train and test data
train <- nbc4vaData[1:50, ]
test <- nbc4vaData[51:100, ]
results <- nbc(train, test)

# Plot the top 3 causes by CSMF
plot(results, top.plot=3)




