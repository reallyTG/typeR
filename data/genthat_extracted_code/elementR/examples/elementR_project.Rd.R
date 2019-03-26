library(elementR)


### Name: elementR_project
### Title: Object elementR_project
### Aliases: elementR_project

### ** Examples

## create a new elementR_repStandard object based on the "filePath" 
## from a folder containing sample replicate

filePath <- system.file("Example_Session", package="elementR")

exampleProject <- elementR_project$new(filePath)

## Display the raw data 

exampleProject$samplesFiles




