library(condformat)


### Name: show_columns
### Title: Selects the variables to be printed
### Aliases: show_columns

### ** Examples


data(iris)
x <- head(iris)

# Include some columns:
condformat(x) %>% show_columns(c(Sepal.Length, Sepal.Width, Species))
condformat(x) %>% show_columns(c("Sepal.Length", "Sepal.Width", "Species"))

# Rename columns:
condformat(x) %>%
  show_columns(c(Sepal.Length, Species),
               col_names = c("Length", "Spec."))

# Exclude some columns:
condformat(x) %>% show_columns(c(-Petal.Length, -Petal.Width))

condformat(x) %>% show_columns(c(starts_with("Petal"), Species))

petal_width <- "Petal.Width"
condformat(x) %>% show_columns(!! petal_width)




