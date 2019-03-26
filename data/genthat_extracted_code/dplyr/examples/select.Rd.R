library(dplyr)


### Name: select
### Title: Select/rename variables by name
### Aliases: select rename

### ** Examples

iris <- as_tibble(iris) # so it prints a little nicer
select(iris, starts_with("Petal"))
select(iris, ends_with("Width"))

# Move Species variable to the front
select(iris, Species, everything())

# Move Sepal.Length variable to back
# first select all variables except Sepal.Length, then re select Sepal.Length
select(iris, -Sepal.Length, Sepal.Length)

df <- as.data.frame(matrix(runif(100), nrow = 10))
df <- tbl_df(df[c(3, 4, 7, 1, 9, 8, 5, 2, 6, 10)])
select(df, V4:V6)
select(df, num_range("V", 4:6))

# Drop variables with -
select(iris, -starts_with("Petal"))

# Select the grouping variables:
starwars %>% group_by(gender) %>% select(group_cols())


# The .data pronoun is available:
select(mtcars, .data$cyl)
select(mtcars, .data$mpg : .data$disp)

# However it isn't available within calls since those are evaluated
# outside of the data context. This would fail if run:
# select(mtcars, identical(.data$cyl))


# Renaming -----------------------------------------
# * select() keeps only the variables you specify
select(iris, petal_length = Petal.Length)

# * rename() keeps all variables
rename(iris, petal_length = Petal.Length)

# * select() can rename variables in a group
select(iris, obs = starts_with('S'))

# Unquoting ----------------------------------------

# Like all dplyr verbs, select() supports unquoting of symbols:
vars <- list(
  var1 = sym("cyl"),
  var2 = sym("am")
)
select(mtcars, !!!vars)

# For convenience it also supports strings and character
# vectors. This is unlike other verbs where strings would be
# ambiguous.
vars <- c(var1 = "cyl", var2 ="am")
select(mtcars, !!vars)
rename(mtcars, !!vars)



