library(supervisedPRIM)


### Name: supervisedPRIM
### Title: Fit PRIM model to a labeled dataset
### Aliases: supervisedPRIM

### ** Examples

# Train a model to determine if a flower is setosa
data(iris)
yData <- factor(ifelse(iris$Species == "setosa", "setosa", "other"), levels = c("setosa", "other"))
xData <- iris
xData$Species <- NULL
primModel <- supervisedPRIM(x = xData, y = yData)



