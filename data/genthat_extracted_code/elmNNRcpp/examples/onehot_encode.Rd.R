library(elmNNRcpp)


### Name: onehot_encode
### Title: One-hot-encoding of the labels in case of classification
### Aliases: onehot_encode

### ** Examples


library(elmNNRcpp)

y = sample(0:3, 100, replace = TRUE)

y_expand = onehot_encode(y)




