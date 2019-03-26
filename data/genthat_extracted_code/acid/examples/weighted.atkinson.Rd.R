library(acid)


### Name: weighted.atkinson
### Title: Atkinson Inequality Index
### Aliases: weighted.atkinson

### ** Examples

x <- c(541, 1463, 2445, 3438, 4437, 5401, 6392, 8304, 11904, 22261)
w <- sample(1:2,length(x),replace=TRUE)
weighted.atkinson(x,w)



