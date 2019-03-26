library(tidyLPA)


### Name: %>%
### Title: Pipe
### Aliases: %>%

### ** Examples

# Instead of
subset(iris, select = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))
# you can write
iris %>%
  subset(select = c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width"))



