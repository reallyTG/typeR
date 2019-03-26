library(dplyr)


### Name: mutate_all
### Title: Mutate multiple columns
### Aliases: mutate_all mutate_if mutate_at transmute_all transmute_if
###   transmute_at

### ** Examples

iris <- as_tibble(iris)

# All variants can be passed functions and additional arguments,
# purrr-style. The _at() variants directly support strings. Here
# we'll scale the variables `height` and `mass`:
scale2 <- function(x, na.rm = FALSE) (x - mean(x, na.rm = na.rm)) / sd(x, na.rm)
starwars %>% mutate_at(c("height", "mass"), scale2)

# You can pass additional arguments to the function:
starwars %>% mutate_at(c("height", "mass"), scale2, na.rm = TRUE)

# You can also pass formulas to create functions on the spot, purrr-style:
starwars %>% mutate_at(c("height", "mass"), ~scale2(., na.rm = TRUE))

# You can also supply selection helpers to _at() functions but you have
# to quote them with vars():
iris %>% mutate_at(vars(matches("Sepal")), log)

# The _if() variants apply a predicate function (a function that
# returns TRUE or FALSE) to determine the relevant subset of
# columns. Here we divide all the numeric columns by 100:
starwars %>% mutate_if(is.numeric, scale2, na.rm = TRUE)

# mutate_if() is particularly useful for transforming variables from
# one type to another
iris %>% mutate_if(is.factor, as.character)
iris %>% mutate_if(is.double, as.integer)


# Multiple transformations ----------------------------------------

# If you want to apply multiple transformations, pass a list of
# functions. When there are multiple functions, they create new
# variables instead of modifying the variables in place:
iris %>% mutate_if(is.numeric, list(scale2, log))

# The list can contain purrr-style formulas:
iris %>% mutate_if(is.numeric, list(~scale2(.), ~log(.)))

# Note how the new variables include the function name, in order to
# keep things distinct. The default names are not always helpful
# but you can also supply explicit names:
iris %>% mutate_if(is.numeric, list(scale = scale2, log = log))

# When there's only one function in the list, it modifies existing
# variables in place. Give it a name to instead create new variables:
iris %>% mutate_if(is.numeric, list(scale2))
iris %>% mutate_if(is.numeric, list(scale = scale2))



