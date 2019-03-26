library(recombinator)


### Name: homogeneous_recombinator
### Title: Process homogeneous batch data.
### Aliases: homogeneous_recombinator

### ** Examples

pre_dataframe <- list(c('variable_one', 'variable_two'), list(1, 'a'), list(2, 'b'))
df <- homogeneous_recombinator(pre_dataframe)
# 2 by 2 dataframe w/ c(1,2), c('a','b') in the columns, respectively.



