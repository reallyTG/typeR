library(dplyr)


### Name: summarise_all
### Title: Summarise multiple columns
### Aliases: summarise_all summarise_if summarise_at summarize_all
###   summarize_if summarize_at

### ** Examples

by_species <- iris %>%
  group_by(Species)


# The _at() variants directly support strings:
starwars %>%
  summarise_at(c("height", "mass"), mean, na.rm = TRUE)

# You can also supply selection helpers to _at() functions but you have
# to quote them with vars():
starwars %>%
  summarise_at(vars(height:mass), mean, na.rm = TRUE)

# The _if() variants apply a predicate function (a function that
# returns TRUE or FALSE) to determine the relevant subset of
# columns. Here we apply mean() to the numeric columns:
starwars %>%
  summarise_if(is.numeric, mean, na.rm = TRUE)

# If you want to apply multiple transformations, pass a list of
# functions. When there are multiple functions, they create new
# variables instead of modifying the variables in place:
by_species %>%
  summarise_all(list(min, max))

# Note how the new variables include the function name, in order to
# keep things distinct. Passing purrr-style lambdas often creates
# better default names:
by_species %>%
  summarise_all(list(~min(.), ~max(.)))

# When that's not good enough, you can also supply the names explicitly:
by_species %>%
  summarise_all(list(min = min, max = max))

# When there's only one function in the list, it modifies existing
# variables in place. Give it a name to create new variables instead:
by_species %>% summarise_all(list(med = median))
by_species %>% summarise_all(list(Q3 = quantile), probs = 0.75)



