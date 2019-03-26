library(Massign)


### Name: Multiplipe
### Title: Quickly test matrix multiplication of two matrices interpreted
###   from strings.
### Aliases: Multiplipe %*>%

### ** Examples

# Basic usage
"1, 2
 3, 4" %*>%
 " 0, 1
   1, 0"

# Second argument can be a matrix:
"1, 2, pi \\ 3, 4, 1 \\ 3, 2, 1" %*>% diag(c(1, 2, 3))

# Or the first, for that matter:
diag(c(1, 2, 3)) %*>% "1, 2, pi \\ 3, 4, 1 \\ 3, 2, 1"





