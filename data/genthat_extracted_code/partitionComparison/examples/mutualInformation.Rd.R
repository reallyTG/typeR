library(partitionComparison)


### Name: mutualInformation
### Title: Mutual Information
### Aliases: mutualInformation mutualInformation,Partition,Partition-method

### ** Examples

isTRUE(all.equal(mutualInformation(new("Partition", c(0, 0, 0, 1, 1)), 
                 new("Partition", c(0, 0, 1, 1, 1))), 4/5*log(5/3) + 1/5*log(5/9)))




