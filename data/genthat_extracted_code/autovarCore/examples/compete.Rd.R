library(autovarCore)


### Name: compete
### Title: Returns the winning model
### Aliases: compete

### ** Examples

model1 <- list(logtransformed = FALSE, lag = 1, nr_dummy_variables = 1,
               model_score = 100, bucket = 0.05)
model2 <- list(logtransformed = FALSE, lag = 2, nr_dummy_variables = 2,
               model_score = 200, bucket = 0.01)
autovarCore:::compete(model1, model2, TRUE)



