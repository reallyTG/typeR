library(purrrlyr)


### Name: by_slice
### Title: Apply a function to slices of a data frame
### Aliases: by_slice

### ** Examples

# Here we fit a regression model inside each slice defined by the
# unique values of the column "cyl". The fitted models are returned
# in a list-column.
mtcars %>%
  slice_rows("cyl") %>%
  by_slice(purrr::partial(lm, mpg ~ disp))

# by_slice() is especially useful in combination with map().

# To modify the contents of a data frame, use rows collation. Note
# that unlike dplyr, Mutating and summarising operations can be
# used indistinctly.

# Mutating operation:
df <- mtcars %>% slice_rows(c("cyl", "am"))
df %>% by_slice(dmap, ~ .x / sum(.x), .collate = "rows")

# Summarising operation:
df %>% by_slice(dmap, mean, .collate = "rows")

# Note that mapping columns within slices is best handled by dmap():
df %>% dmap(~ .x / sum(.x))
df %>% dmap(mean)

# If you don't need the slicing variables as identifiers, switch
# .labels to FALSE:
mtcars %>%
  slice_rows("cyl") %>%
  by_slice(purrr::partial(lm, mpg ~ disp), .labels = FALSE) %>%
  purrr::flatten() %>%
  purrr::map(coef)



