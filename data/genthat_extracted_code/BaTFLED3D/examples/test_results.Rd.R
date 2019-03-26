library(BaTFLED3D)


### Name: test_results
### Title: Get RMSE & explained variance for warm and cold test results
### Aliases: test_results

### ** Examples

data.params <- get_data_params(c('decomp=Tucker'))
toy <- mk_toy(data.params)

# Make training data object excluding the first two samples for modes 1 & 2.
train.data <- input_data$new(mode1.X=toy$mode1.X[-(1:2),-1],
                             mode2.X=toy$mode2.X[-(1:2),-1],
                             mode3.X=toy$mode3.X[,-1],
                             resp=toy$resp)
# Remove some responses for warm prediction
warm.ind <- sample(1:prod(dim(train.data$resp)), 20)
warm.resp <- train.data$resp[warm.ind]
train.data$resp[warm.ind] <- NA

# Make testing objects 
m1.test.data <- input_data$new(mode1.X=toy$mode1.X[1:2,-1],
                               mode2.X=toy$mode2.X[-(1:2),-1],
                               mode3.X=toy$mode3.X[,-1],
                               resp=toy$resp[1:2,-(1:2),])
m2.test.data <- input_data$new(mode1.X=toy$mode1.X[-(1:2),-1],
                               mode2.X=toy$mode2.X[1:2,-1],
                               mode3.X=toy$mode3.X[,-1],
                               resp=toy$resp[-(1:2),1:2,])
m1m2.test.data <- input_data$new(mode1.X=toy$mode1.X[1:2,-1],
                                 mode2.X=toy$mode2.X[1:2,-1],
                                 mode3.X=toy$mode3.X[,-1],
                                 resp=toy$resp[1:2,1:2,])
                               
model.params <- get_model_params(c('decomp=Tucker'))
toy.model <- mk_model(train.data, model.params)
toy.model$rand_init(model.params)
toy.model$iter <- 1

test.results <- numeric(0)
test_results(m=toy.model, d=train.data, warm.resp=warm.resp, 
             test.m1=m1.test.data, test.m2=m2.test.data, 
             test.m1m2=m1m2.test.data)



