library(bazar)


### Name: sumNA
### Title: Modified sum of vector elements
### Aliases: sumNA

### ** Examples

x <- c(NA, NA)
sum(x)
sumNA(x)
sum(x, na.rm = TRUE)
sumNA(x, na.rm = TRUE) # here is the difference with 'sum()'

sum(c())
sumNA(c())




