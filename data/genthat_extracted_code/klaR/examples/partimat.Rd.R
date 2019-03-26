library(klaR)


### Name: partimat
### Title: Plotting the 2-d partitions of classification methods
### Aliases: partimat partimat.default partimat.formula partimat.data.frame
###   partimat.matrix
### Keywords: classif dplot

### ** Examples

library(MASS)
data(iris)
partimat(Species ~ ., data = iris, method = "lda")
## Not run: 
##D partimat(Species ~ ., data = iris, method = "lda", 
##D     plot.matrix = TRUE, imageplot = FALSE) # takes some time ...
## End(Not run)



