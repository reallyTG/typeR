library(EGRET)


### Name: removeDuplicates
### Title: Remove duplicates values from Sample data frame.
### Aliases: removeDuplicates

### ** Examples

DecYear <- c('1985.01', '1985.01', '1985.02', '1985.02', '1985.03')
ConcHigh <- c(1,2,3,3,5)
dataInput <- data.frame(DecYear, ConcHigh, stringsAsFactors=FALSE)
Sample <- removeDuplicates(dataInput)



