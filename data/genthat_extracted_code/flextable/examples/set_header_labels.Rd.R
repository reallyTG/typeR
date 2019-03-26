library(flextable)


### Name: set_header_labels
### Title: Set flextable's headers labels
### Aliases: set_header_labels

### ** Examples

ft_1 <- flextable( head( iris ))
ft_1 <- set_header_labels(ft_1, Sepal.Length = "Sepal length",
  Sepal.Width = "Sepal width", Petal.Length = "Petal length",
  Petal.Width = "Petal width"
)
ft_1



