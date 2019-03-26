library(lenses)


### Name: filter_il
### Title: Filter lens
### Aliases: filter_il

### ** Examples

head(view(iris, filter_il(Species == "setosa"))) 
head(over(iris,
          filter_il(Species == "setosa") %.% select_l(-Species),
          function(x) x + 10))



