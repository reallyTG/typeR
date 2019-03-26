library(grade)


### Name: grade.number
### Title: Grade Single Numbers
### Aliases: grade.number
### Keywords: misc

### ** Examples

grade.number(1, "1") # TRUE
grade.number(1, "1.1", tolerance=".01") # FALSE

grade.number(pi, "3.142", tolerance=".001") # TRUE

grade.number(1, "[1]") # TRUE



