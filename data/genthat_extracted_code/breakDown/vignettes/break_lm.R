## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
url <- 'https://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-white.csv'
wine <- read.table(url, header = T, sep=";")
head(wine, 3)

## ------------------------------------------------------------------------
model <- lm(quality ~ fixed.acidity + volatile.acidity + citric.acid + residual.sugar + chlorides + free.sulfur.dioxide + total.sulfur.dioxide + density + pH + sulphates + alcohol,
               data = wine)

## ------------------------------------------------------------------------
summary(model)$r.squared
summary(model)$adj.r.squared
BIC(model)

## ---- fig.width=7--------------------------------------------------------
library(breakDown)
library(ggplot2)

new_observation <- wine[1,]
br <- broken(model, new_observation)
br
# different roundings
print(br, digits = 2, rounding_function = signif)
print(br, digits = 6, rounding_function = round)
plot(br) + ggtitle("breakDown plot for predicted quality of a wine")

## ---- fig.width=7--------------------------------------------------------
br <- broken(model, new_observation, baseline = "Intercept")
br
plot(br) + ggtitle("breakDown plot for predicted quality of a wine")

## ---- fig.width=7--------------------------------------------------------
model <- lm(quality ~ (alcohol + density  + residual.sugar)^2,
               data = wine)
new_observation <- wine[1,]

br <- broken(model, new_observation, baseline = "Intercept")
br
plot(br) + ggtitle("breakDown plot for predicted quality of a wine")

