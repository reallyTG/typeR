library(plyr)


### Name: l_ply
### Title: Split list, apply function, and discard results.
### Aliases: l_ply
### Keywords: manip

### ** Examples

l_ply(llply(mtcars, round), table, .print = TRUE)
l_ply(baseball, function(x) print(summary(x)))



