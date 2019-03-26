library(mltest)


### Name: ml_test
### Title: multi-class classifier evaluation metrics based on a confusion
###   matrix (contingency table)
### Aliases: ml_test
### Keywords: utilities

### ** Examples

library(mltest)

# class labels ("cat, "dog" and "rat") predicted by the classifier model
predicted_labels <- as.factor(c("dog", "cat", "dog", "rat", "rat"))

# true labels (test set)
true_labels <- as.factor(c("dog", "cat", "dog", "rat", "dog"))

classifier_metrics <- ml_test(predicted_labels, true_labels, output.as.table = FALSE)

# overall classification accuracy
accuracy <- classifier_metrics$accuracy

# F1-measures for classes "cat", "dog" and "rat"
F1 <- classifier_metrics$F1

# tabular view of the metrics (except for 'accuracy' and 'error.rate')
classifier_metrics <- ml_test(predicted_labels, true_labels, output.as.table = TRUE)




