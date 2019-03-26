library(eva)


### Name: gevrEd
### Title: GEVr Entropy Difference Test
### Aliases: gevrEd

### ** Examples

## This will test if the GEV2 distribution fits the data.
x <- rgevr(100, 2, loc = 0.5, scale = 1, shape = 0.5)
result <- gevrEd(x)



