library(groupdata2)


### Name: group_factor
### Title: Create grouping factor for subsetting your data.
### Aliases: group_factor

### ** Examples

# Attach packages
library(groupdata2)
library(dplyr)

# Create a dataframe
df <- data.frame("x"=c(1:12),
 "species" = rep(c('cat','pig', 'human'), 4),
 "age" = sample(c(1:100), 12))

# Using group_factor() with n_dist
groups <- group_factor(df, 5, method = 'n_dist')
df$groups <- groups

# Using group_factor() with greedy
groups <- group_factor(df, 5, method = 'greedy')
df$groups <- groups

# Using group_factor() with l_sizes
groups <- group_factor(df, list(0.2, 0.3), method = 'l_sizes')
df$groups <- groups

# Using group_factor() with l_starts
groups <- group_factor(df, list('cat', c('pig',2), 'human'),
                       method = 'l_starts', starts_col = 'species')
df$groups <- groups




