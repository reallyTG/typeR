library(BaTFLED3D)


### Name: CP_model
### Title: BaTFLED model object for 3-D response tensor with CP
###   decomposition.
### Aliases: CP_model
### Keywords: data

### ** Examples

data.params <- get_data_params(c('decomp=CP'))
toy <- mk_toy(data.params)
train.data <- input_data$new(mode1.X=toy$mode1.X[,-1],
                             mode2.X=toy$mode2.X[,-1],
                             mode3.X=toy$mode3.X[,-1],
                             resp=toy$resp)
model.params <- get_model_params(c('decomp=CP'))
toy.model <- mk_model(train.data, model.params)
toy.model$rand_init(model.params)



