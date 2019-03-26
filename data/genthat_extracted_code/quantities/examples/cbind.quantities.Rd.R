library(quantities)


### Name: cbind.quantities
### Title: Combine R Objects by Rows or Columns
### Aliases: cbind.quantities rbind.quantities

### ** Examples

x <- set_quantities(1, m/s, 0.1)
y <- set_quantities(1:3, m/s, 0.2)
z <- set_quantities(8:10, m/s, 0.1)
(m <- cbind(x, y)) # the '1' (= shorter vector) is recycled
(m <- cbind(m, z)[, c(1, 3, 2)]) # insert a column
(m <- rbind(m, z)) # insert a row




