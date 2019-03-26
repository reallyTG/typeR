## ----message = FALSE-----------------------------------------------------
library(pdp)
data(boston)
str(boston)
data(boston)
set.seed(123)

library(randomForest)
boston.rf <- randomForest(cmedv ~ lstat + ptratio + age, data = boston)

## ----message = FALSE-----------------------------------------------------
library(xspliner)
model_xs <- xspline(cmedv ~ xs(lstat) + xs(ptratio) + age, model = boston.rf)

## ------------------------------------------------------------------------
plot(model_xs, "lstat")

## ------------------------------------------------------------------------
plot(model_xs, "lstat", data = boston, plot_data = TRUE)

## ------------------------------------------------------------------------
plot(model_xs, "lstat", plot_deriv = TRUE)

## ------------------------------------------------------------------------
plot(model_xs, "ptratio", plot_response = FALSE, plot_deriv = TRUE)

## ------------------------------------------------------------------------
plot(model_xs, model = boston.rf, data = boston)

## ------------------------------------------------------------------------
iris_data <- droplevels(iris[iris$Species != "setosa", ])

library(e1071) 
library(xspliner)
model_svm <- svm(Species ~  Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, 
                 data = iris_data, probability = TRUE)

model_xs <- xspline(Species ~  xs(Sepal.Length) + xs(Sepal.Width) + xs(Petal.Length) + xs(Petal.Width),
                    model = model_svm)

## ------------------------------------------------------------------------
prob_svm <- function(object, newdata) attr(predict(object, newdata = newdata, probability = TRUE), "probabilities")[, 2]
prob_xs <- function(object, newdata) predict(object, newdata = newdata, type = "response")

## ------------------------------------------------------------------------
plot(model_xs, model = model_svm, data = iris_data,
     prediction_funs = list(prob_svm, prob_xs)
)  

## ------------------------------------------------------------------------
plot(model_xs, model = model_svm, data = iris_data,
     prediction_funs = list(prob_svm, prob_xs),
     sort_by = "svm"
)  

## ----message = FALSE-----------------------------------------------------
library(mgcv)

data(airquality)
ozone <- subset(na.omit(airquality),
                select = c("Ozone", "Solar.R", "Wind", "Temp"))
set.seed(123)

model_rf <- randomForest(Ozone ~ ., data = ozone)
model_xs <- xspline(Ozone ~ xs(Solar.R) + xs(Wind) + xs(Temp), model_rf, data = ozone)
model_glm <- glm(Ozone ~ ., data = ozone)
model_gam <- mgcv::gam(Ozone ~ s(Solar.R) + s(Wind) + s(Temp), data = ozone)

plot(model_xs, 
     model = model_rf, 
     data = ozone, 
     compare_with = list(glm = model_glm, gam = model_gam),
     sort_by = "xspliner")

## ----fig.width = 9.5-----------------------------------------------------
plot(model_xs)

## ----fig.width = 9.5-----------------------------------------------------
plot(model_xs, n_plots = 2)

## ----fig.width = 9.5-----------------------------------------------------
plot(model_xs, c("Wind", "Temp"))

