library(dplyr)


### Name: mutate
### Title: Create or transform variables
### Aliases: mutate transmute

### ** Examples

# Newly created variables are available immediately
mtcars %>% as_tibble() %>% mutate(
  cyl2 = cyl * 2,
  cyl4 = cyl2 * 2
)

# You can also use mutate() to remove variables and
# modify existing variables
mtcars %>% as_tibble() %>% mutate(
  mpg = NULL,
  disp = disp * 0.0163871 # convert to litres
)


# window functions are useful for grouped mutates
mtcars %>%
 group_by(cyl) %>%
 mutate(rank = min_rank(desc(mpg)))
# see `vignette("window-functions")` for more details

# You can drop variables by setting them to NULL
mtcars %>% mutate(cyl = NULL)

# mutate() vs transmute --------------------------
# mutate() keeps all existing variables
mtcars %>%
  mutate(displ_l = disp / 61.0237)

# transmute keeps only the variables you create
mtcars %>%
  transmute(displ_l = disp / 61.0237)


# The mutate operation may yield different results on grouped
# tibbles because the expressions are computed within groups.
# The following normalises `mass` by the global average:
starwars %>%
  mutate(mass / mean(mass, na.rm = TRUE)) %>%
  pull()

# Whereas this normalises `mass` by the averages within gender
# levels:
starwars %>%
  group_by(gender) %>%
  mutate(mass / mean(mass, na.rm = TRUE)) %>%
  pull()

# Note that you can't overwrite grouping variables:
gdf <- mtcars %>% group_by(cyl)
try(mutate(gdf, cyl = cyl * 100))


# Refer to column names stored as strings with the `.data` pronoun:
vars <- c("mass", "height")
mutate(starwars, prod = .data[[vars[[1]]]] * .data[[vars[[2]]]])

# For more complex cases, knowledge of tidy evaluation and the
# unquote operator `!!` is required. See https://tidyeval.tidyverse.org/
#
# One useful and simple tidy eval technique is to use `!!` to
# bypass the data frame and its columns. Here is how to divide the
# column `mass` by an object of the same name:
mass <- 100
mutate(starwars, mass = mass / !!mass)



