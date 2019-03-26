library(BaTFLED3D)


### Name: update_mode2_CP
### Title: Update the second mode in a CP model.
### Aliases: update_mode2_CP

### ** Examples

data.params <- get_data_params(c('decomp=CP'))
toy <- mk_toy(data.params)
train.data <- input_data$new(mode1.X=toy$mode1.X[,-1],
                             mode2.X=toy$mode2.X[,-1],
                             mode3.X=toy$mode3.X,
                             resp=toy$resp)
model.params <- get_model_params(c('decomp=CP'))
toy.model <- mk_model(train.data, model.params)
toy.model$rand_init(model.params)

update_mode2_CP(m=toy.model, d=train.data, params=model.params)



