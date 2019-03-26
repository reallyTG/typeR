library(untb)


### Name: simpson
### Title: Simpson's diversity index
### Aliases: simpson
### Keywords: math

### ** Examples

data(butterflies)

D <- simpson(butterflies)
theta <- optimal.prob(butterflies)*2*no.of.ind(butterflies)

# compare theta with D/(1-D) (should be roughly equal; see He & Hu 2005):
theta
D/(1-D)


# Second argument pedantic in practice.

# Mostly, the difference is small:
simpson(butterflies,FALSE) - simpson(butterflies,TRUE)

# Most extreme example:
x <- count(c(1,1))
simpson(x,TRUE)
simpson(x,FALSE)





