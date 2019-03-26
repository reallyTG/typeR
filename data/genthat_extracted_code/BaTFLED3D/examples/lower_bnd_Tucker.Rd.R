library(BaTFLED3D)


### Name: lower_bnd_Tucker
### Title: Calculate the lower bound of the log likelihood for a trained
###   Tucker model
### Aliases: lower_bnd_Tucker

### ** Examples

data.params <- get_data_params(c('decomp=Tucker'))
toy <- mk_toy(data.params)
train.data <- input_data$new(mode1.X=toy$mode1.X[,-1],
                             mode2.X=toy$mode2.X[,-1],
                             mode3.X=toy$mode3.X[,-1],
                             resp=toy$resp)
model.params <- get_model_params(c('decomp=Tucker'))
toy.model <- mk_model(train.data, model.params)
toy.model$rand_init(model.params)

lower_bnd_Tucker(toy.model, train.data)



