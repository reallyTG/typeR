library(GetDFPData)


### Name: my.merge.dfs.lists
### Title: Merges (row wise) dataframes from different list, using names of
###   dataframes as index
### Aliases: my.merge.dfs.lists

### ** Examples


l.1 <- list(x = data.frame(runif(10)) )
l.2 <- list(x = data.frame(runif(10)) )

l <- my.merge.dfs.lists(l.1, l.2)




