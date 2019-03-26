library(condformat)


### Name: show_columns_old
### Title: Selects the variables to be printed (deprecated)
### Aliases: show_columns_old

### ** Examples


library(dplyr) # for starts_with()
data(iris)
x <- head(iris)

# Include some columns:
condformat(x) + show_columns(Sepal.Length, Sepal.Width, Species)

# Rename columns:
condformat(x) + show_columns(Sepal.Length, Species, col_names = c("Length", "Spec."))

# Exclude some columns:
condformat(x) + show_columns(-Petal.Length, -Petal.Width)

# Select columns using dplyr syntax:
condformat(x) + show_columns(starts_with("Petal"), Species)




