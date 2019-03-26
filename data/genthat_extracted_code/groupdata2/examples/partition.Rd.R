library(groupdata2)


### Name: partition
### Title: Create balanced partitions.
### Aliases: partition

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

# Using partition()
# Without cat_col and id_col
partitions <- partition(df, c(0.2,0.3))

# With cat_col
partitions <- partition(df, c(0.5), cat_col = 'diagnosis')

# With id_col
partitions <- partition(df, c(0.5), id_col = 'participant')

# With cat_col and id_col
partitions <- partition(df, c(0.5), cat_col = 'diagnosis',
                        id_col = 'participant')

# Return dataframe with grouping factor
# with list_out = FALSE
partitions <- partition(df, c(0.5), list_out = FALSE)




