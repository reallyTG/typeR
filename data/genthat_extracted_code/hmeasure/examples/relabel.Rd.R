library(hmeasure)


### Name: relabel
### Title: Converts class labels to the default choice of numeric 0s and 1s
### Aliases: relabel
### Keywords: ~classif

### ** Examples


relabel(c("0","1","1"))
relabel(c("no","yes","yes"))
relabel(c(FALSE,TRUE,TRUE))

# the code complains if the number of classes present in the vector is not 2
try(relabel(c("0","1","2")))
try(relabel(c("1","1","1")))




