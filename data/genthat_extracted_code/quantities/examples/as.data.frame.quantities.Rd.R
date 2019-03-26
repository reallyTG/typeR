library(quantities)


### Name: as.data.frame.quantities
### Title: Coerce to a Data Frame
### Aliases: as.data.frame.quantities

### ** Examples

x <- set_quantities(1:3, m/s, 0.1)
y <- set_quantities(4:6, m/s, 0.2)
(z <- cbind(x, y))
as.data.frame(z)




