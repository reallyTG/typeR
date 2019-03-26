library(kernlab)


### Name: specc-class
### Title: Class "specc"
### Aliases: specc-class centers size withinss centers,specc-method
###   withinss,specc-method size,specc-method kernelf,specc-method
### Keywords: classes

### ** Examples

## Cluster the spirals data set.
data(spirals)

sc <- specc(spirals, centers=2)

centers(sc)
size(sc)



