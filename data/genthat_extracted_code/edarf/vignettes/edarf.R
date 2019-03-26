## ----echo=FALSE----------------------------------------------------------
knitr::opts_chunk$set(error = TRUE)

## ------------------------------------------------------------------------
library(edarf)

data(iris)
library(party)
fit <- cforest(Species ~ ., iris, controls = cforest_unbiased(mtry = 2))
pd <- partial_dependence(fit, vars = "Petal.Width", n = c(10, 25))
print(pd)

## ---- fig.width = 8, fig.height = 4--------------------------------------
plot_pd(pd)

## ---- fig.width = 8, fig.height = 4--------------------------------------
pd_list <- partial_dependence(fit, c("Petal.Width", "Petal.Length"), n = c(10, 25), interaction = FALSE)
plot_pd(pd_list)

## ---- fig.width = 8, fig.height = 8--------------------------------------
pd_int <- partial_dependence(fit, c("Petal.Length", "Petal.Width"), n = c(10, 25), interaction = TRUE)
plot_pd(pd_int)

## ---- fig.width = 8, fig.height = 5--------------------------------------
imp <- variable_importance(fit, nperm = 10)
plot_imp(imp)

## ---- fig.width = 8, fig.height = 8--------------------------------------
fit <- cforest(Species ~ ., iris, control = cforest_unbiased(mtry = 2))
prox <- extract_proximity(fit)
pca <- prcomp(prox, scale = TRUE)
plot_prox(pca, color = iris$Species, color_label = "Species", size = 2)

## ---- fig.width = 8, fig.height = 5--------------------------------------
fit <- cforest(Fertility ~ ., swiss)
pred <- as.numeric(predict(fit, newdata = swiss))
plot_pred(pred, swiss$Fertility,
  outlier_idx = which((pred - swiss$Fertility)^2 > var(swiss$Fertility)),
  labs = row.names(swiss))

