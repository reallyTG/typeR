library(mldr)


### Name: Basic metrics
### Title: Multi-label evaluation metrics
### Aliases: 'Basic metrics' hamming_loss subset_accuracy

### ** Examples

true_labels <- matrix(c(
1,1,1,
0,0,0,
1,0,0,
1,1,1,
0,0,0,
1,0,0
), ncol = 3, byrow = TRUE)
predicted_labels <- matrix(c(
1,1,1,
0,0,0,
1,0,0,
1,1,0,
1,0,0,
0,1,0
), ncol = 3, byrow = TRUE)

hamming_loss(true_labels, predicted_labels)
subset_accuracy(true_labels, predicted_labels)



