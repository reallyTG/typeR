library(recombinator)


### Name: heterogeneous_recombinator
### Title: Process heterogeneous batch data.
### Aliases: heterogeneous_recombinator

### ** Examples

pre_dataframe <-
  list(list(variable_one = 1, variable_two = 'a'),
       list(variable_one = 2, variable_three = 1))
df <- heterogeneous_recombinator(pre_dataframe)
# 3 by 2 dataframe w/ c(1,2), c('a', NA), c(NA, 1) in the columns, respectively.



