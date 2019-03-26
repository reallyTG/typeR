library(NoiseFiltersR)


### Name: PRISM
### Title: PReprocessing Instances that Should be Misclassified
### Aliases: PRISM PRISM.default PRISM.formula

### ** Examples

data(iris)
out <- PRISM(Species~., data = iris)
print(out)
identical(out$cleanData, iris[setdiff(1:nrow(iris),out$remIdx),])



