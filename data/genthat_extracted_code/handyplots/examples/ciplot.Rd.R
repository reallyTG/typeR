library(handyplots)


### Name: ciplot
### Title: Confidence Interval Plot
### Aliases: ciplot

### ** Examples

##predicting the mean petal width of an iris whose petal length is 2.5
ciplot(iris$Petal.Length,iris$Petal.Width,x0=2.5,int="conf")

##predicting a single new observation of the petal width of an iris whose petal length is 2.5
ciplot(iris$Petal.Length,iris$Petal.Width,x0=2.5,int="pred")

##extrapolating the data to predict the mean of the width of an iris's petal whose petal length is 8
ciplot(iris$Petal.Length,iris$Petal.Width,x0=8,int="conf")

##zooming in to the previous graph and removing the dotted red lines
ciplot(iris$Petal.Length,iris$Petal.Width,x0=8,int="conf",show.range=FALSE,
user.xlim=c(7.5,8.5),user.ylim=c(2.6,3.2))



