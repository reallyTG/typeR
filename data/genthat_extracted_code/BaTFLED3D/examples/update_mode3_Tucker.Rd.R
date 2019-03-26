library(BaTFLED3D)


### Name: update_mode3_Tucker
### Title: Update the third mode in a Tucker model.
### Aliases: update_mode3_Tucker

### ** Examples

data.params <- get_data_params(c('decomp=Tucker'))
toy <- mk_toy(data.params)
train.data <- input_data$new(mode1.X=toy$mode1.X[,-1],
                             mode2.X=toy$mode2.X[,-1],
                             mode3.X=toy$mode3.X,
                             resp=toy$resp)
model.params <- get_model_params(c('decomp=Tucker'))
toy.model <- mk_model(train.data, model.params)
toy.model$rand_init(model.params)

update_mode3_Tucker(m=toy.model, d=train.data, params=model.params)



