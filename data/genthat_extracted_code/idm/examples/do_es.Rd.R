library(idm)


### Name: do_es
### Title: Computes the eigenspace of a data matrix
### Aliases: do_es

### ** Examples

#Iris species
data("iris", package = "datasets")
eg = do_es(iris[,-5]) 
#corresponds to the SVD of the centered data matrix



