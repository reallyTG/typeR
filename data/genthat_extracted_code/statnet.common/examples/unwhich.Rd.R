library(statnet.common)


### Name: unwhich
### Title: Construct a logical vector with 'TRUE' in specified positions.
### Aliases: unwhich

### ** Examples


x <- as.logical(rbinom(10,1,0.5))
stopifnot(all(x == unwhich(which(x), 10)))



