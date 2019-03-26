## ----setup, echo = FALSE-------------------------------------------------
knitr::opts_chunk$set(warning = FALSE)
knitr::opts_chunk$set(message = FALSE)

## ------------------------------------------------------------------------
library(auditor)
set.seed(123)

## ---- results='hide', fig.keep='all'-------------------------------------
data("corn", package = "hnp")
head(corn)

## ----binomial2, results='hide', fig.keep='all'---------------------------
model.bin <- glm(cbind(y, m - y) ~ extract, family = binomial, data = corn)

bin_au <- audit(model.bin, data = corn, y = corn$y)

## ------------------------------------------------------------------------
plotHalfNormal(bin_au, sim=500)

## ---- results='hide', fig.keep='all'-------------------------------------
model.bin <- glm(cbind(y, m - y) ~ extract, family = binomial, data = corn)
bin_au <- audit(model.bin, data = corn, y = corn$y)

bin_mf <- modelFit(bin_au)

plot(bin_mf, sim=500)

## ----quasibinomial2, results='hide', fig.keep='all'----------------------
fit2_b <- glm(cbind(y, m - y) ~ extract, family = quasibinomial, data = corn)
fit2_b_au <- audit(fit2_b, data = corn, y = corn$y)
plotHalfNormal(fit2_b_au, sim=500)

## ----beta-binomial2, results='hide', fig.keep='all'----------------------
library(aods3)
fit3_b <- aodml(cbind(y, m - y) ~ extract, family = "bb", data = corn)
fit3_b_au <- audit(fit3_b, data = corn, y = corn$y)
plotHalfNormal(fit3_b_au, sim=500)

## ----normal-logit-binomial, results='hide', fig.keep='all'---------------
x <- factor(seq_len(nrow(corn)))
fit4_b <- glmer(cbind(y, m - y) ~ extract + (1 | x), family = binomial, data = corn)
fit4_b_au <- audit(fit4_b, data = corn, y = corn$y)
plotHalfNormal(fit4_b_au, sim=500)

## ---- results='hide', fig.keep='all'-------------------------------------
plotHalfNormal(fit2_b_au, quant.scale = TRUE)

## ------------------------------------------------------------------------
library(randomForest)
iris_rf <- randomForest(Species ~ ., data=iris)
iris_rf_au <- audit(iris_rf, data = iris, y = iris$Species)
plotHalfNormal(iris_rf_au)

