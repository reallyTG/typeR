library(Causata)


### Name: ReplaceOutliers.CausataData
### Title: Replace outliers in a CausataData object.
### Aliases: ReplaceOutliers.CausataData

### ** Examples

df <- data.frame(variable1__All.Past=c(1,2,3,4,1000))
# create CausataData object
causataData <- CausataData(df, rep(0,nrow(df)))
# max is 1000 before outliers are replaced
max(causataData$df$variable1__All.Past) 
causataData <- ReplaceOutliers(causataData, 'variable1__All.Past', upperLimit=4)
# now max is 4 after outliers are replaced
max(causataData$df$variable1__All.Past) 



