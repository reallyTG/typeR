library(groupdata2)


### Name: splt
### Title: Split data by a range of methods.
### Aliases: splt

### ** Examples

# Attach packages
library(groupdata2)
library(dplyr)

# Create dataframe
df <- data.frame("x"=c(1:12),
 "species" = rep(c('cat','pig', 'human'), 4),
 "age" = sample(c(1:100), 12))

# Using splt()
df_list <- splt(df, 5, method = 'n_dist')




