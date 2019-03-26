library(capwire)


### Name: indToClass
### Title: Convert a table of individuals into a table of class data
### Aliases: indToClass

### ** Examples

## create a vector of capture counts

counts <- c(1,1,1,2,2,2,3,3,4)

## make into a table of individuals

ind.data <- buildIndTable(counts)

## convert to table of classes

data <- classToInd(ind.data)

data




