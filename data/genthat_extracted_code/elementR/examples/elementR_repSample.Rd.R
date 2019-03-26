library(elementR)


### Name: elementR_repSample
### Title: object elementR_repSample
### Aliases: elementR_repSample

### ** Examples

## create a new elementR_sample object based on the "filePath" 
## from a folder containing sample replicate

filePath <- system.file("Example_Session/samples/Sample_1", package="elementR")

sampleBatch <- elementR_repSample$new(filePath)

## Display the data contained in this batch

sampleBatch$rep_data



