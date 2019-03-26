library(scorecardModelUtils)


### Name: sampling
### Title: Random sampling of data into train and test
### Aliases: sampling

### ** Examples

data <- iris
sampling_list <- sampling(base = data,train_perc = 0.7,seed = 1234)
sampling_list$train
sampling_list$test
sampling_list$seed



