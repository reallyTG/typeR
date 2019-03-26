library(dplyr)


### Name: distinct
### Title: Select distinct/unique rows
### Aliases: distinct

### ** Examples

df <- tibble(
  x = sample(10, 100, rep = TRUE),
  y = sample(10, 100, rep = TRUE)
)
nrow(df)
nrow(distinct(df))
nrow(distinct(df, x, y))

distinct(df, x)
distinct(df, y)

# Can choose to keep all other variables as well
distinct(df, x, .keep_all = TRUE)
distinct(df, y, .keep_all = TRUE)

# You can also use distinct on computed variables
distinct(df, diff = abs(x - y))

# The same behaviour applies for grouped data frames
# except that the grouping variables are always included
df <- tibble(
  g = c(1, 1, 2, 2),
  x = c(1, 1, 2, 1)
) %>% group_by(g)
df %>% distinct()
df %>% distinct(x)

# Values in list columns are compared by reference, this can lead to
# surprising results
tibble(a = as.list(c(1, 1, 2))) %>% glimpse() %>% distinct()
tibble(a = as.list(1:2)[c(1, 1, 2)]) %>% glimpse() %>% distinct()



