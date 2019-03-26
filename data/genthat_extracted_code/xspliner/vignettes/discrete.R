## ------------------------------------------------------------------------
HR_data <- breakDown::HR_data
str(HR_data)

## ----message = FALSE-----------------------------------------------------
library(randomForest)
model_rf <- randomForest(average_montly_hours ~ last_evaluation + salary + satisfaction_level, data = HR_data)

## ----message = FALSE, warning = FALSE------------------------------------
library(xspliner)
model_xs <- xspline(
  average_montly_hours ~ last_evaluation + xf(salary, transition = list(value = 2)) + satisfaction_level,
  model = model_rf
)

summary(model_xs)

## ------------------------------------------------------------------------
summary(model_xs, "salary")

## ------------------------------------------------------------------------
plot(model_xs, "salary")

## ------------------------------------------------------------------------
iris_data <- droplevels(iris[iris$Species != "setosa", ])

## ------------------------------------------------------------------------
library(e1071) 
library(xspliner)
model_svm <- svm(Species ~  Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                 data = iris_data, probability = TRUE)

## ------------------------------------------------------------------------
model_xs <- xspline(Species ~  xs(Sepal.Length) + xs(Sepal.Width) + xs(Petal.Length) + xs(Petal.Width),
                    model = model_svm)
summary(model_xs)

## ------------------------------------------------------------------------
plot(model_xs, "Petal.Width")

