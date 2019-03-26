library(tempR)


### Name: fill.gaps
### Title: Fills gaps
### Aliases: fill.gaps

### ** Examples

# vector with gaps: x with NA gaps (e.g. due to attribute cuing)
(x <- rep(c(rep(NA, 4), rep(1, 4)), 2))
fill.gaps(x, subst = NA)

# array with gaps: y with an gap of 0s (e.g. due to attribute fading)
(y <- structure(c(0, 1, 0, 0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 0,
                  1, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0),
                .Dim = c(3L, 10L),
                .Dimnames = list(1:3, 1:10)))
fill.gaps(y)



