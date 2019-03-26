library(dplyr)


### Name: distinct_all
### Title: Select distinct rows by a selection of variables
### Aliases: distinct_all distinct_at distinct_if

### ** Examples

df <- tibble(x = rep(2:5, each = 2) / 2, y = rep(2:3, each = 4) / 2)
df
distinct_all(df)
distinct_at(df, vars(x,y))
distinct_if(df, is.numeric)

# You can supply a function that will be applied before extracting the distinct values
# The variables of the sorted tibble keep their original values.
distinct_all(df, round)
arrange_all(df, list(~round(.)))



