library(NlinTS)


### Name: varmlp
### Title: Artificial Neural Network VAR (Vector Auto-Regressive) model
###   using a MultiLayer Perceptron.
### Aliases: varmlp

### ** Examples

library (timeSeries) # to extract time series
library (NlinTS)
#load data
data = LPP2005REC
# Prepare data to make one forecasts
train_data = head (data, nrow (data) - 1)
test_data = tail (data, 1)
model = varmlp (train_data, 1, c(10,5), 200, TRUE)
predictions = model$forecast (train_data)
print (tail (predictions,1))
# Update the model (learning from new data)
model$train (test_data)



