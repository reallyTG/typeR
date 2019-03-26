library(rangeBuilder)


### Name: flipSign
### Title: Flip sign of coordinates
### Aliases: flipSign

### ** Examples

#correct coordinates
flipSign(c(4.28, 39.98), country = 'Spain')

#mistake in coordinate sign
flipSign(c(115.436, 32.657), country = 'United States')

#incorrect sign on both long and lat, but not possible to distinguish for longitude
#except when we consider which alternative coords fall on land.
flipSign(c(-4.28, -39.98), country = 'Spain', filterByLand = FALSE, returnMultiple = TRUE)
flipSign(c(-4.28, -39.98), country = 'Spain', returnMultiple = TRUE)

#coordinates are incorrect
flipSign(c(4.28, 59.98), country = 'Spain')



