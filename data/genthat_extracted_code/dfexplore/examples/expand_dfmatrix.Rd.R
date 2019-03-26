library(dfexplore)


### Name: expand_dfmatrix
### Title: Transform a data frame containing matrix to a data frame without
###   matrix
### Aliases: expand_dfmatrix

### ** Examples

dataframe_with_matrix <- simulate_dataframe( includeMatrix=TRUE)
str(dataframe_with_matrix)
dataframe_without_matrix <- expand_dfmatrix(dataframe_with_matrix)
str(dataframe_without_matrix)




