library(EGRET)


### Name: populateDateColumns
### Title: Populate Date Columns
### Aliases: populateDateColumns decimalDate

### ** Examples

dateTime <- c('1984-02-28 13:56', '1984-03-01 00:00', '1986-03-01 00:00',"1986-10-15 00:00")
expandedDateDF <- populateDateColumns(dateTime)
dateTime <- c('1984-02-28', '1984-03-01', '1986-03-01',"1986-10-15")
expandedDateDF <- populateDateColumns(dateTime)
dateTime <- c('1984-02-28 13:56', '1984-03-01 00:00', '1986-03-01 00:00',"1986-10-15 00:00")
decimalDate(dateTime)



