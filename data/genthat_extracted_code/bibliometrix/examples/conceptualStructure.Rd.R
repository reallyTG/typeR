library(bibliometrix)


### Name: conceptualStructure
### Title: Creating and plotting conceptual structure map of a scientific
###   field
### Aliases: conceptualStructure

### ** Examples

# EXAMPLE Conceptual Structure using Keywords Plus

data(scientometrics)

CS <- conceptualStructure(scientometrics, field="ID", method="CA", 
             stemming=FALSE, minDegree=3, k.max = 5)




