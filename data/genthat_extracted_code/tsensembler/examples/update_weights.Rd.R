library(tsensembler)


### Name: update_weights
### Title: Updating the weights of base models
### Aliases: update_weights update_weights,ADE-method
###   update_weights,DETS-method

### ** Examples

data("water_consumption")
dataset <- embed_timeseries(water_consumption, 5)

# toy size for checks
train <- dataset[1:300,]
test <- dataset[301:305, ]

specs <- model_specs(c("bm_ppr","bm_glm","bm_mars"), NULL)
## same with model <- DETS(target ~., train, specs)
model <- ADE(target ~., train, specs)

# if consecutive know observations are predicted (e.g. a validation/test set)
# the updating is automatically done internally.
predictions1 <- predict(model, test)@y_hat

# otherwise, the models need to be updated
predictions <- numeric(nrow(test))
# predict new data and update the weights of the model
for (i in seq_along(predictions)) {
  predictions[i] <- predict(model, test[i, ])@y_hat

  model <- update_weights(model, test[i, ])
}

all.equal(predictions1, predictions)





