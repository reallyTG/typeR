library(DBI)


### Name: rownames
### Title: Convert row names back and forth between columns
### Aliases: rownames sqlRownamesToColumn sqlColumnToRownames

### ** Examples

# If have row names
sqlRownamesToColumn(head(mtcars))
sqlRownamesToColumn(head(mtcars), FALSE)
sqlRownamesToColumn(head(mtcars), "ROWNAMES")

# If don't have
sqlRownamesToColumn(head(iris))
sqlRownamesToColumn(head(iris), TRUE)
sqlRownamesToColumn(head(iris), "ROWNAMES")




