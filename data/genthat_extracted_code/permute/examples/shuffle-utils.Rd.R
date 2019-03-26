library(permute)


### Name: shuffle-utils
### Title: Utility functions for unrestricted and restricted permutations
### Aliases: shuffle-utils shuffleFree shuffleGrid shuffleSeries
###   shuffleStrata
### Keywords: htest design

### ** Examples

set.seed(3)

## draw 1 value at random from the set 1:10
shuffleFree(1:10, 1)

## permute the series 1:10
x <- 1:10
shuffleSeries(x)                ## with random starting point
shuffleSeries(x, start = 5L)    ## known starting point
shuffleSeries(x, flip = TRUE)   ## random start, forced mirror
shuffleSeries(x, mirror = TRUE) ## random start, possibly mirror

## permute a grid of size 3x3
shuffleGrid(3, 3)                      ## random starting row/col
shuffleGrid(3, 3, start.row = 2,
            start.col = 3)             ## with known row/col
shuffleGrid(3, 3, flip = rep(TRUE, 2)) ## random start, forced mirror



