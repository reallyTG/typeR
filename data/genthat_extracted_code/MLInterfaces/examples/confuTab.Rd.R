library(MLInterfaces)


### Name: confuTab
### Title: Compute confusion tables for a confusion matrix.
### Aliases: confuTab

### ** Examples

## the confusion matrix
cm <- table(iris$Species, sample(iris$Species))
## the 3 confusion tables
(ct <- confuTab(cm))



