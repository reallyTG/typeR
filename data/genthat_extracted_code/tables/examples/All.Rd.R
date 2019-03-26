library(tables)


### Name: All
### Title: Include all columns of a dataframe.
### Aliases: All

### ** Examples

# Show mean and sd of all numeric columns in the iris data
tabular( Species  ~ 
       All(iris)*(mean + sd), data=iris )



