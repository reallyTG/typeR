library(errors)


### Name: cbind.errors
### Title: Combine R Objects by Rows or Columns
### Aliases: cbind.errors rbind.errors

### ** Examples

x <- set_errors(1, 0.1)
y <- set_errors(1:3, 0.2)
(m <- cbind(x, y)) # the '1' (= shorter vector) is recycled
(m <- cbind(m, 8:10)[, c(1, 3, 2)]) # insert a column
cbind(y, diag(3)) # vector is subset -> warning
cbind(0, rbind(x, y))




