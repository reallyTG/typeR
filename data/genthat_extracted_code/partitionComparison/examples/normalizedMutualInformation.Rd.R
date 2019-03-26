library(partitionComparison)


### Name: normalizedMutualInformation
### Title: Normalized Mutual Information
### Aliases: normalizedMutualInformation
###   normalizedMutualInformation,Partition,Partition,character-method
###   normalizedMutualInformation,Partition,Partition,missing-method

### ** Examples

isTRUE(all.equal(normalizedMutualInformation(
                   new("Partition", c(0, 0, 0, 1, 1)),
                   new("Partition", c(0, 0, 1, 1, 1)), "min"),
                 normalizedMutualInformation(
                   new("Partition", c(0, 0, 0, 1, 1)), 
                   new("Partition", c(0, 0, 1, 1, 1)), "max")
                 ))




