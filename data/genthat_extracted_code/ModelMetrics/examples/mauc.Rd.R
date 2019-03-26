library(ModelMetrics)


### Name: mauc
### Title: Multiclass Area Under the Curve
### Aliases: mauc

### ** Examples

setosa <- glm(I(Species == 'setosa') ~ Sepal.Length, data = iris, family = 'binomial')
versicolor <- glm(I(Species == 'versicolor') ~ Sepal.Length, data = iris, family = 'binomial')
virginica <- glm(I(Species == 'virginica') ~ Sepal.Length, data = iris, family = 'binomial')

Pred <-
  data.frame(
    setosa = predict(setosa, type = 'response')
    ,versicolor = predict(versicolor, type = 'response')
    ,virginica = predict(virginica, type = 'response')
  )

Predicted = Pred/rowSums(Pred)
Actual = iris$Species

mauc(Actual, Predicted)




