library(EGRET)


### Name: populateSampleColumns
### Title: Populate Sample Columns
### Aliases: populateSampleColumns

### ** Examples

dateTime <- c('1985-01-01', '1985-01-02', '1985-01-03')
ConcLow <- c(1,2,0)
ConcHigh <- c(1,2,3)
Uncen <- c(1,1,0)
dataInput <- data.frame(dateTime, ConcLow, ConcHigh, Uncen, stringsAsFactors=FALSE)
Sample <- populateSampleColumns(dataInput)



