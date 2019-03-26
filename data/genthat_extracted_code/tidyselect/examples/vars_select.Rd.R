library(tidyselect)


### Name: vars_rename
### Title: Select or rename variables
### Aliases: vars_rename vars_select
### Keywords: internal

### ** Examples

# Keep variables
vars_select(names(iris), everything())
vars_select(names(iris), starts_with("Petal"))
vars_select(names(iris), ends_with("Width"))
vars_select(names(iris), contains("etal"))
vars_select(names(iris), matches(".t."))
vars_select(names(iris), Petal.Length, Petal.Width)
vars_select(names(iris), one_of("Petal.Length", "Petal.Width"))

df <- as.data.frame(matrix(runif(100), nrow = 10))
df <- df[c(3, 4, 7, 1, 9, 8, 5, 2, 6, 10)]
vars_select(names(df), num_range("V", 4:6))

# Drop variables
vars_select(names(iris), -starts_with("Petal"))
vars_select(names(iris), -ends_with("Width"))
vars_select(names(iris), -contains("etal"))
vars_select(names(iris), -matches(".t."))
vars_select(names(iris), -Petal.Length, -Petal.Width)

# Rename variables
vars_select(names(iris), petal_length = Petal.Length)
vars_select(names(iris), petal = starts_with("Petal"))

# Rename variables preserving all existing
vars_rename(names(iris), petal_length = Petal.Length)

# You can unquote symbols or quosures
vars_select(names(iris), !! quote(Petal.Length))

# And unquote-splice lists of symbols or quosures
vars_select(names(iris), !!! list(quo(Petal.Length), quote(Petal.Width)))


# If you want to avoid ambiguity about where to find objects you
# have two solutions provided by the tidy eval framework. If you
# want to refer to local objects, you can explicitly unquote
# them. They must contain variable positions (integers) or variable
# names (strings):
Species <- 2
vars_select(names(iris), Species)     # Picks up `Species` from the data frame
vars_select(names(iris), !! Species)  # Picks up the local object referring to column 2

# If you want to make sure that a variable is picked up from the
# data, you can use the `.data` pronoun:
vars_select(names(iris), .data$Species)


# If you're writing a wrapper around vars_select(), pass the dots
# via splicing to avoid matching dotted arguments to vars_select()
# named arguments (`vars`, `include` and `exclude`):
wrapper <- function(...) {
  vars_select(names(mtcars), !!! quos(...))
}

# This won't partial-match on `vars`:
wrapper(var = cyl)

# This won't match on `include`:
wrapper(include = cyl)


# If your wrapper takes named arguments, you need to capture then
# unquote to pass them to vars_select(). See the vignette on
# programming with dplyr for more on this:
wrapper <- function(var1, var2) {
  vars_select(names(mtcars), !! enquo(var1), !! enquo(var2))
}
wrapper(starts_with("d"), starts_with("c"))



