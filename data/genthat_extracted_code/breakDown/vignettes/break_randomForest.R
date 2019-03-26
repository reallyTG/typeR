## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
set.seed(1313)

library(breakDown)
head(HR_data, 3)

## ------------------------------------------------------------------------
library("randomForest")
model <- randomForest(factor(left)~., data = HR_data, family = "binomial", maxnodes = 5)

## ---- fig.width=7--------------------------------------------------------
library(ggplot2)

predict.function <- function(model, new_observation) predict(model, new_observation, type="prob")[,2]
predict.function(model, HR_data[11,-7])

explain_1 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
                    predict.function = predict.function, 
                    direction = "down")
explain_1
plot(explain_1) + ggtitle("breakDown plot  (direction=down) for randomForest model")

explain_2 <- broken(model, HR_data[11,-7], data = HR_data[,-7],
                    predict.function = predict.function, 
                    direction = "up")
explain_2
plot(explain_2) + ggtitle("breakDown plot (direction=up) for randomForest model")


