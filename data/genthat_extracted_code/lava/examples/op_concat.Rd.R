library(lava)


### Name: %++%
### Title: Concatenation operator
### Aliases: %++%
### Keywords: misc utilities

### ** Examples

## Block diagonal
matrix(rnorm(25),5)%++%matrix(rnorm(25),5)
## String concatenation
"Hello "%++%" World"
## Function composition
f <- log %++% exp
f(2)



