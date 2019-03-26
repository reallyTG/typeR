library(rfUtilities)


### Name: accuracy
### Title: Accuracy
### Aliases: accuracy

### ** Examples

 # Two classes (vector)
 observed <- sample(c(rep("Pres",50),rep("Abs",50)), 100, replace=TRUE )
 accuracy(observed[sample(1:length(observed))], observed)

 # Two classes (contingency table)
accuracy(cbind(c(15,11), c(2,123)))

 # Multiple classes
 accuracy(iris[sample(1:150),]$Species, iris$Species)




