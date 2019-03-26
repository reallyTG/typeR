library(tsutils)


### Name: abcxyz
### Title: ABC-XYZ visualisation
### Aliases: abcxyz
### Keywords: ts

### ** Examples

x <- abs(matrix(cumsum(rnorm(5400,0,1)),36,150))
abcxyz(abc(x),xyz(x,type="cv"))




