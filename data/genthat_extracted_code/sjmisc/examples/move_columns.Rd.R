library(sjmisc)


### Name: move_columns
### Title: Move columns to other positions in a data frame
### Aliases: move_columns

### ** Examples

data(iris)

iris %>%
  move_columns(Sepal.Width, .after = "Species") %>%
  head()

iris %>%
  move_columns(Sepal.Width, .before = Sepal.Length) %>%
  head()

iris %>%
  move_columns(Species, .before = 1) %>%
  head()

iris %>%
  move_columns("Species", "Petal.Length", .after = 1) %>%
  head()

library(dplyr)
iris %>%
  move_columns(contains("Width"), .after = "Species") %>%
  head()




