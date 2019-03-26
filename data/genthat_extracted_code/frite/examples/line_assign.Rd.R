library(frite)


### Name: line_assign
### Title: Wraps a line of code within a function in assign()
### Aliases: line_assign

### ** Examples


new_map <- line_assign(strwidth, line = 3, assign_to = 'abc')
line_insert(new_map, after_line = 4, quote(return(abc)))





