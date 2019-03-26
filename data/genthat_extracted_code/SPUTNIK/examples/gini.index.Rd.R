library(SPUTNIK)


### Name: gini.index
### Title: Gini index.
### Aliases: gini.index

### ** Examples

## Load package
library("SPUTNIK")

## Image
im <- matrix(rnorm(100), 10, 10)

## Spatial chaos
sc <- spatial.chaos(im, levels = 30, morph = TRUE)
stopifnot(sc <= 1)

## Gini index
gi <- gini.index(im, levels = 16)
stopifnot(gi >= -1 && gi <= 1)

## Scatter ratio
sr <- scatter.ratio(im)
stopifnot(sr <= 1)



