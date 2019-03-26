library(funcy)


### Name: label2lowerk
### Title: Relabeling of clusters.
### Aliases: label2lowerk
### Keywords: relabel

### ** Examples

##Generating cluster labels for 4 clusters
cl <- rep(sample(2:10, 4), sample(3:5,4, replace=TRUE))
cl

##Labels them to 1:4
label2lowerk(cl)



