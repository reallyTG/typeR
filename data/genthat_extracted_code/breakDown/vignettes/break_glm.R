## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(breakDown)
head(HR_data, 3)

## ------------------------------------------------------------------------
model <- glm(left~., data = HR_data, family = "binomial")

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)
predict(model, HR_data[11,], type = "link")

explain_1 <- broken(model, HR_data[11,])
explain_1
plot(explain_1) + ggtitle("breakDown plot for linear predictors")

## ---- fig.width=7--------------------------------------------------------
predict(model, HR_data[11,], type = "response")

explain_1 <- broken(model, HR_data[11,], baseline = "intercept")
explain_1
plot(explain_1, 
     trans = function(x) exp(x)/(1+exp(x))) + ggtitle("Predicted probability of leaving the company")+ scale_y_continuous( limits = c(0,1), name = "probability", expand = c(0,0))


