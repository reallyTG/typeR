library(sjPlot)


### Name: tab_df
### Title: Print data frames as HTML table.
### Aliases: tab_df tab_dfs

### ** Examples

## Not run: 
##D data(iris)
##D data(mtcars)
##D tab_df(iris[1:5, ])
##D tab_dfs(list(iris[1:5, ], mtcars[1:5, 1:5]))
##D 
##D # sort 2nd column ascending
##D tab_df(iris[1:5, ], sort.column = 2)
##D 
##D # sort 2nd column descending
##D tab_df(iris[1:5, ], sort.column = -2)
## End(Not run)




