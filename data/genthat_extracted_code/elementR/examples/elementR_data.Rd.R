library(elementR)


### Name: elementR_data
### Title: Object elementR_data
### Aliases: elementR_data

### ** Examples

## create a new elementR_data object based on the "filePath" 
## from a file containing data (accepted format of data: .csv, .ods, .xls, .xlsx)

filePath <- system.file("Example_Session/standards/Stand3.xls", package="elementR")

standard <- elementR_data$new(filePath)

## Display the raw data 

standard$data





