library(elementR)


### Name: elementR_repStandard
### Title: Object elementR_repStandard
### Aliases: elementR_repStandard

### ** Examples

## create a new elementR_repStandard object based on the "filePath" 
## from a folder containing sample replicate

filePath <- system.file("Example_Session/standards", package="elementR")

standBatch <- elementR_repStandard$new(rep_folderPath = filePath)

## Display the files contained in this batch

standBatch$rep_Files



