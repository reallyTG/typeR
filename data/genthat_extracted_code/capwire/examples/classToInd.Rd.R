library(capwire)


### Name: classToInd
### Title: Convert a table of capture class data into a table of
###   individuals
### Aliases: classToInd

### ** Examples

## create a vector of capture counts

counts <- c(1,1,1,2,2,2,3,3,4)

## make into a table of classes

class.data <- buildClassTable(counts)

## convert to table of individuals

data <- classToInd(class.data)

data



