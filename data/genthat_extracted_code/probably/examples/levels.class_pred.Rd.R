library(probably)


### Name: levels.class_pred
### Title: Extract 'class_pred' levels
### Aliases: levels.class_pred

### ** Examples


x <- class_pred(factor(1:5), which = 1)

# notice that even though `1` is not in the `class_pred` vector, the
# level remains from the original factor
levels(x)




