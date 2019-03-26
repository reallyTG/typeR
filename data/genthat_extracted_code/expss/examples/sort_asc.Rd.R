library(expss)


### Name: sort_asc
### Title: Sort data.frames/matrices/vectors
### Aliases: sort_asc .sort_asc sort_desc .sort_desc

### ** Examples

data(mtcars)
sort_asc(mtcars, mpg)
sort_asc(mtcars, cyl, mpg) # by two column

# same results with column nums
sort_asc(mtcars, 1)
sort_asc(mtcars, 2:1) # by two column
sort_asc(mtcars, 2, 1) # by two column

# call with parameter
sorting_columns = c("cyl", "mpg")
sort_asc(mtcars, (sorting_columns)) 




