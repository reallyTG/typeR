library(partitionComparison)


### Name: jaccardCoefficient
### Title: Jaccard Coefficient
### Aliases: jaccardCoefficient
###   jaccardCoefficient,Partition,Partition-method
###   jaccardCoefficient,PairCoefficients,missing-method

### ** Examples

isTRUE(all.equal(jaccardCoefficient(new("Partition", c(0, 0, 0, 1, 1)), 
                                    new("Partition", c(0, 0, 1, 1, 1))), 1/3))




