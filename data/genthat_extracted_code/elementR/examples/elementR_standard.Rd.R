library(elementR)


### Name: elementR_standard
### Title: Object elementR_standard
### Aliases: elementR_standard

### ** Examples

## create a new elementR_standard object based on the "filePath" from a file containing data

filePath <- system.file("Example_Session/standards/Stand1.csv", package="elementR")

standardExample <- elementR_standard$new(filePath)

## Display the raw data 

standardExample$data




