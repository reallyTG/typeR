library(tibble)


### Name: add_column
### Title: Add columns to a data frame
### Aliases: add_column

### ** Examples

# add_column ---------------------------------
df <- tibble(x = 1:3, y = 3:1)

add_column(df, z = -1:1, w = 0)

# You can't overwrite existing columns
## Not run: 
##D add_column(df, x = 4:6)
## End(Not run)
# You can't create new observations
## Not run: 
##D add_column(df, z = 1:5)
## End(Not run)



