library(groupdata2)


### Name: find_starts
### Title: Find start positions of groups in data.
### Aliases: find_starts

### ** Examples

# Attach packages
library(groupdata2)

# Create a dataframe
df <- data.frame('a' = c('a','a','b',
                         'b','c','c'))

# Get start values for new groups in column 'a'
find_starts(df, col = 'a')

# Get indices of start values for new groups
# in column 'a'
find_starts(df, col = 'a',
            return_index = TRUE)

## Use found starts with l_starts method
# Notice: This is equivalent to n = 'auto'
# with l_starts method

# Get start values for new groups in column 'a'
starts <- find_starts(df, col = 'a')

# Use starts in group() with 'l_starts' method
group(df, n = starts, method = 'l_starts',
      starts_col = 'a')

# Similar but with indices instead of values

# Get indices of start values for new groups
# in column 'a'
starts_ind <- find_starts(df, col = 'a',
                          return_index = TRUE)

# Use starts in group() with 'l_starts' method
group(df, n = starts_ind, method = 'l_starts',
      starts_col = 'index')





