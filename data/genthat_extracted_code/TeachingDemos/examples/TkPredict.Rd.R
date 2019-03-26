library(TeachingDemos)


### Name: TkPredict
### Title: Plot predicted values from a model against one of the predictors
###   for a given value of the othe predictors
### Aliases: TkPredict Predict.Plot
### Keywords: dynamic iplot regression

### ** Examples

library(splines)

fit.lm1 <- lm( Sepal.Width ~ ns(Petal.Width,3)*ns(Petal.Length,3)+Species,
	data=iris)

Predict.Plot(fit.lm1, pred.var = "Petal.Width", Petal.Width = 1.22,
      Petal.Length = 4.3, Species = "versicolor",
 	plot.args = list(ylim=range(iris$Sepal.Width), col='blue'),
      type = "response")
Predict.Plot(fit.lm1, pred.var = "Petal.Width", Petal.Width = 1.22,
      Petal.Length = 4.3, Species = "virginica",
	plot.args = list(col='red'),
      type = "response", add=TRUE)
Predict.Plot(fit.lm1, pred.var = "Petal.Width", Petal.Width = 1.22,
      Petal.Length = 4.4, Species = "virginica",
	plot.args = list(col='purple'),
      type = "response", add=TRUE)

fit.glm1 <- glm( Species=='virginica' ~ Sepal.Width+Sepal.Length,
	data=iris, family=binomial)

Predict.Plot(fit.glm1, pred.var = "Sepal.Length", Sepal.Width = 1.99,
      Sepal.Length = 6.34, plot.args = list(ylim=c(0,1), col='blue'),
 	type = "response")
Predict.Plot(fit.glm1, pred.var = "Sepal.Length", Sepal.Width = 4.39,
      Sepal.Length = 6.34, plot.args = list(col='red'),
	type = "response", add=TRUE)




if(interactive()){
TkPredict(fit.lm1)

TkPredict(fit.glm1)
}




