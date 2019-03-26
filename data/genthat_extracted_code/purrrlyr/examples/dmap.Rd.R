library(purrrlyr)


### Name: dmap
### Title: Map over the columns of a data frame
### Aliases: dmap dmap_at dmap_if

### ** Examples

# dmap() always returns a data frame:
dmap(mtcars, summary)

# dmap() also supports sliced data frames:
sliced_df <- mtcars[1:5] %>% slice_rows("cyl")
sliced_df %>% dmap(mean)
sliced_df %>% dmap(~ .x / max(.x))

# This is equivalent to the combination of by_slice() and dmap()
# with 'rows' collation of results:
sliced_df %>% by_slice(dmap, mean, .collate = "rows")



