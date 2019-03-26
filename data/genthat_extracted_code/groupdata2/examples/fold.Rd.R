library(groupdata2)


### Name: fold
### Title: Create balanced folds for cross-validation.
### Aliases: fold

### ** Examples

# Attach packages
library(groupdata2)
library(dplyr)

# Create dataframe
df <- data.frame(
 "participant" = factor(rep(c('1','2', '3', '4', '5', '6'), 3)),
 "age" = rep(sample(c(1:100), 6), 3),
 "diagnosis" = rep(c('a', 'b', 'a', 'a', 'b', 'b'), 3),
 "score" = sample(c(1:100), 3*6))
df <- df[order(df$participant),]
df$session <- rep(c('1','2', '3'), 6)

# Using fold()
# Without cat_col and id_col
df_folded <- fold(df, 3, method = 'n_dist')

# With cat_col
df_folded <- fold(df, 3, cat_col = 'diagnosis',
 method = 'n_dist')

# With id_col
df_folded <- fold(df, 3, id_col = 'participant',
 method = 'n_dist')

# With cat_col and id_col
df_folded <- fold(df, 3, cat_col = 'diagnosis',
 id_col = 'participant', method = 'n_dist')

# Order by folds
df_folded <- df_folded[order(df_folded$.folds),]




