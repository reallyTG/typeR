library(handyplots)


### Name: resplot
### Title: Residual Plot
### Aliases: resplot

### ** Examples

##plot a residual plot to check the model assumptions for a linear
##model of iris petal length as a predicted by iris petal width
model<-lm(iris$Petal.Length~iris$Petal.Width)
resplot(model)

##highlight the one outlier
resplot(model,highlight.outliers=TRUE)

##zoom in to only show the residuals between -1 and 1
resplot(model,zoom=1)



