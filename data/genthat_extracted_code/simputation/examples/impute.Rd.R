library(simputation)


### Name: impute
### Title: Impute using a previously fitted model.
### Aliases: impute impute_

### ** Examples


irisNA <- iris
iris[1:3,1] <- NA
my_model <- lm(Sepal.Length ~ Sepal.Width + Species, data=iris)
impute(irisNA, Sepal.Length ~ my_model)




