library(dataPreparation)


### Name: dateFormatUnifier
### Title: Unify dates format
### Aliases: dateFormatUnifier

### ** Examples

# build a data.table
require(data.table)
dataSet <- data.table( column1 = as.Date("2016-01-01"), column2 = as.POSIXct("2017-01-01") )

# Use the function
dataSet = dateFormatUnifier(dataSet, format = "Date")

# Control result
sapply(dataSet, class)
# return Date for both columns



