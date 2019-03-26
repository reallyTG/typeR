## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
library(breakDown)
head(HR_data, 3)

## ------------------------------------------------------------------------
library(ranger)
HR_data$left <- factor(HR_data$left)
model <- ranger(left ~ ., data = HR_data, importance = 'impurity', probability=TRUE, min.node.size = 2000)

predict.function <- function(model, new_observation) predict(model, new_observation, type = "response")$predictions[,2]

predict.function(model, HR_data[11,])


## ---- fig.width=7--------------------------------------------------------
library(ggplot2)

explain_1 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
                    predict.function = predict.function, 
                    direction = "down")
explain_1
plot(explain_1) + ggtitle("breakDown plot  (direction=down) for ranger model")

explain_2 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
                    predict.function = predict.function, 
                    direction = "up")
explain_2
plot(explain_2) + ggtitle("breakDown plot (direction=up) for ranger model")

