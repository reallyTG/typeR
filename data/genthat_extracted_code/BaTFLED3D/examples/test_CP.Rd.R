library(BaTFLED3D)


### Name: test_CP
### Title: Perform 'cold start' prediction using BaTFLED algorthm for CP
###   models
### Aliases: test_CP

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

train(d=train.data, m=toy.model, new.iter=1, params=model.params)

resp <- test_CP(train.data, toy.model)



