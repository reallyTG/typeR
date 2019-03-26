library(SAMURAI)


### Name: BHHR2009p92
### Title: Fictional Data Set, with Binary Outcomes
### Aliases: BHHR2009p92
### Keywords: datasets

### ** Examples

library(SAMURAI)
data(BHHR2009p92)

forestsens(table=BHHR2009p92, binary=TRUE, higher.is.better=FALSE)

# To assign all unpublished studies to each of ten outlooks, one at a time, 
# and then return a table of summary effects, their 95% confidence interval, 
# and tau-squared.
summtab <- forestsens(table=BHHR2009p92, binary=TRUE, higher.is.better=FALSE, all.outlooks=TRUE)
summtab



