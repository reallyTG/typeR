library(GGally)


### Name: is_horizontal
### Title: Check if plot is horizontal
### Aliases: is_horizontal is_character_column

### ** Examples

is_horizontal(iris, ggplot2::aes(Sepal.Length, Species)) # TRUE
is_horizontal(iris, ggplot2::aes(Sepal.Length, Species), "x") # FALSE
is_horizontal(iris, ggplot2::aes(Sepal.Length, Sepal.Width)) # FALSE



