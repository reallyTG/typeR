library(utiml)


### Name: multilabel_confusion_matrix
### Title: Compute the confusion matrix for a multi-label prediction
### Aliases: multilabel_confusion_matrix

### ** Examples

## Not run: 
##D prediction <- predict(br(toyml), toyml)
##D 
##D mlconfmat <- multilabel_confusion_matrix(toyml, prediction)
##D 
##D # Label with the most number of True Positive values
##D which.max(mlconfmat$TPl)
##D 
##D # Number of wrong predictions for each label
##D errors <- mlconfmat$FPl + mlconfmat$FNl
##D 
##D # Examples predict with all labels
##D which(mlconfmat$Zi == toyml$measures$num.labels)
##D 
##D # You can join one or more mlconfmat
##D part1 <- create_subset(toyml, 1:50)
##D part2 <- create_subset(toyml, 51:100)
##D confmatp1 <- multilabel_confusion_matrix(part1, prediction[1:50, ])
##D confmatp2 <- multilabel_confusion_matrix(part2, prediction[51:100, ])
##D mlconfmat <- confmatp1 + confmatp2
## End(Not run)



