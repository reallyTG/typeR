library(quantable)


### Name: removeNArows
### Title: Removes rows with more than thresh NA's from matrix
### Aliases: removeNArows

### ** Examples


x = matrix(rnorm(10*10),ncol=10)
dim(x)
x[3,3] = NA
x = removeNArows(x)
dim(x)



