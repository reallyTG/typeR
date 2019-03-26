library(dplyr)


### Name: summarise
### Title: Reduce multiple values down to a single value
### Aliases: summarise summarize

### ** Examples

# A summary applied to ungrouped tbl returns a single row
mtcars %>%
  summarise(mean = mean(disp), n = n())

# Usually, you'll want to group first
mtcars %>%
  group_by(cyl) %>%
  summarise(mean = mean(disp), n = n())

# Each summary call removes one grouping level (since that group
# is now just a single row)
mtcars %>%
  group_by(cyl, vs) %>%
  summarise(cyl_n = n()) %>%
  group_vars()

# Note that with data frames, newly created summaries immediately
# overwrite existing variables
mtcars %>%
  group_by(cyl) %>%
  summarise(disp = mean(disp), sd = sd(disp))


# Refer to column names stored as strings with the `.data` pronoun:
var <- "mass"
summarise(starwars, avg = mean(.data[[var]], na.rm = TRUE))

# For more complex cases, knowledge of tidy evaluation and the
# unquote operator `!!` is required. See https://tidyeval.tidyverse.org/
#
# One useful and simple tidy eval technique is to use `!!` to
# bypass the data frame and its columns. Here is how to divide the
# column `mass` by an object of the same name:
mass <- 100
summarise(starwars, avg = mean(mass / !!mass, na.rm = TRUE))



