library(berryFunctions)


### Name: pretty2
### Title: Truncated pretty breakpoints
### Aliases: pretty2
### Keywords: dplot

### ** Examples


k <- c(135, 155, 120, 105, 140, 130, 190, 110)
range(k)
pretty(k)
pretty2(k)

pretty(c(0.2, 0.9), n=2)
pretty2(c(0.2, 0.9), n=2)
pretty2(c(0.2, 0.9), n=2, force=TRUE)




