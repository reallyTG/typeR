library(labelled)


### Name: sort_val_labels
### Title: Sort value labels
### Aliases: sort_val_labels sort_val_labels.labelled
###   sort_val_labels.data.frame

### ** Examples

v <- labelled(c(1, 2, 3), c(maybe = 2, yes = 1, no = 3))
v
sort_val_labels(v)
sort_val_labels(v, decreasing = TRUE)
sort_val_labels(v, 'l')
sort_val_labels(v, 'l', TRUE)



