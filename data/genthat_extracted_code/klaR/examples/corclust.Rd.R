library(klaR)


### Name: corclust
### Title: Function to identify groups of highly correlated variables for
###   removing correlated features from the data for further analysis.
### Aliases: corclust plot.corclust
### Keywords: cluster multivariate classif manip attribute

### ** Examples

    data(iris)
    classes <- iris$Species
    variables <- iris[,1:4]
    ccres <- corclust(variables, classes)
    plot(ccres, mincor = 0.6)



