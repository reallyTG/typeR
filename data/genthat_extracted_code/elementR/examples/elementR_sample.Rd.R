library(elementR)


### Name: elementR_sample
### Title: Object elementR_sample
### Aliases: elementR_sample

### ** Examples

## create a new elementR_sample object based on the "filePath" from a file containing data
## replicate (accepted format of data: .csv, .ods, .xls, .xlsx)

filePath <- system.file("Example_Session/samples/Sample_1/Sample1_Rep1.csv", package="elementR")

sampleExample <- elementR_sample$new(filePath)

## Display the name of the object 

sampleExample$name





