library(farver)


### Name: compare_colour
### Title: Calculate the distance between colours
### Aliases: compare_colour

### ** Examples

r <- t(col2rgb(rainbow(10)))
h <- t(col2rgb(heat.colors(15)))

# Compare two sets of colours
compare_colour(r, h, 'rgb', method = 'cie2000')

# Compare a set of colours with itself
compare_colour(r, from_space = 'rgb', method = 'cmc')



