library(xpose4)


### Name: add_transformed_columns
### Title: Column-transformation functions for Xpose 4
### Aliases: add_transformed_columns add.absval add.dichot add.exp add.log
###   add.tad

### ** Examples


## Not run: 
##D ## xpdb5 is an Xpose data object
##D ## We expect to find the required NONMEM run and table files for run
##D ## 5 in the current working directory
##D xpdb5 <- xpose.data(5)
##D 
##D ## Create a column containing the absolute values of data in another 
##D ## column
##D add.absval(xpdb5)
##D 
##D ## Create a categorical data column based on a continuous data column, 
##D ## and do not list variables 
##D add.dichot(xpdb5, listall = FALSE)
##D 
##D ## Create a column containing the exponentiated values of data in 
##D ## another column
##D add.exp(xpdb5)
##D 
##D ## Create a column containing log-transformations of data in another 
##D ## column
##D add.log(xpdb5)
##D 
##D ## Create a time-after-dose column
##D add.tad(xpdb5)
## End(Not run)




