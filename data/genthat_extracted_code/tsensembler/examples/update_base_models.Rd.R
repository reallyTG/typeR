library(tsensembler)


### Name: update_base_models
### Title: Update the base models of an ensemble
### Aliases: update_base_models update_base_models,ADE-method
###   update_base_models,DETS-method

### ** Examples

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)
# toy size for checks execution time
train <- dataset[1:300,]
test <- dataset[301:305, ]

specs <- model_specs(c("bm_ppr","bm_glm","bm_mars"), NULL)

model <- ADE(target ~., train, specs)

predictions <- numeric(nrow(test))
for (i in seq_along(predictions)) {
  predictions[i] <- predict(model, test[i, ])@y_hat
  model <-
    update_base_models(model,
                       rbind.data.frame(train, test[seq_len(i), ]))
}

####

specs2 <- model_specs(c("bm_ppr","bm_randomforest","bm_svr"), NULL)

modeldets <- DETS(target ~., train, specs2)

predictions <- numeric(nrow(test))
# predict new data and update models every three points
# in the remaining points, the only the weights are updated
for (i in seq_along(predictions)) {
  predictions[i] <- predict(modeldets, test[i, ])@y_hat

  if (i %% 3 == 0)
    modeldets <-
      update_base_models(modeldets,
                         rbind.data.frame(train, test[seq_len(i), ]))
  else
    modeldets <- update_weights(modeldets, test[seq_len(i), ])
}





