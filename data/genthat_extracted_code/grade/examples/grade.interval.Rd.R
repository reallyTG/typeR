library(grade)


### Name: grade.interval
### Title: Grade Intervals
### Aliases: grade.interval
### Keywords: misc

### ** Examples

grade.interval(c(1,2), "[1,2]") # TRUE
grade.interval(c(1,2), "[1.1,2]", tolerance=".01") # FALSE

grade.interval(c(1,pi), "(1,3.142)", tolerance=".001") # TRUE



