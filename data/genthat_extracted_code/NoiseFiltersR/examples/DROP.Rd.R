library(NoiseFiltersR)


### Name: DROP
### Title: Decremental Reduction Optimization Procedures
### Aliases: DROP DROP1 DROP1.default DROP1.formula DROP2 DROP2.default
###   DROP2.formula DROP3 DROP3.default DROP3.formula

### ** Examples

# Next example is not run in order to save time
## Not run: 
##D data(iris)
##D trainData <- iris[c(1:20,51:70,101:120),]
##D out1 <- DROP1(Species~ Petal.Length + Petal.Width, data = trainData)
##D summary(out1, explicit = TRUE)
##D identical(out1$cleanData, trainData[setdiff(1:nrow(trainData),out1$remIdx),])
## End(Not run)



