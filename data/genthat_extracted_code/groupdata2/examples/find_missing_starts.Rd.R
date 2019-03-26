library(groupdata2)


### Name: find_missing_starts
### Title: Find start positions that cannot be found in data.
### Aliases: find_missing_starts

### ** Examples

# Attach packages
library(groupdata2)

# Create a dataframe
df <- data.frame('a' = c('a','a','b',
                         'b','c','c'))

# Create list of starts
starts <- c("a", "e", "b", "d", "c")

# Find missing starts with skip_to numbers
find_missing_starts(df, starts, starts_col = 'a')

# Find missing starts without skip_to numbers
find_missing_starts(df, starts, starts_col = 'a',
                    return_skip_numbers = FALSE)



