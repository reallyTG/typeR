library(groupdata2)


### Name: group
### Title: Create groups from your data.
### Aliases: group window binning split

### ** Examples

# Attach packages
library(groupdata2)
library(dplyr)

# Create dataframe
df <- data.frame("x"=c(1:12),
 "species" = rep(c('cat','pig', 'human'), 4),
 "age" = sample(c(1:100), 12))

# Using group()
df_grouped <- group(df, 5, method = 'n_dist')

# Using group() with dplyr pipeline to get mean age
df_means <- df %>%
 group(5, method = 'n_dist') %>%
 dplyr::summarise(mean_age = mean(age))

# Using group_factor() with l_starts
# "c('pig',2)" skips to the second appearance of
# "pig" after the first appearance of "cat"
df_grouped <- group(df,
                    list('cat', c('pig',2), 'human'),
                    method = 'l_starts',
                    starts_col = 'species')




