library(dplyr)


### Name: arrange_all
### Title: Arrange rows by a selection of variables
### Aliases: arrange_all arrange_at arrange_if

### ** Examples

df <- as_tibble(mtcars)
df
arrange_all(df)

# You can supply a function that will be applied before taking the
# ordering of the variables. The variables of the sorted tibble
# keep their original values.
arrange_all(df, desc)
arrange_all(df, list(~desc(.)))



