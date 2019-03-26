library(ffbase)


### Name: min.ff
### Title: Minimum, maximum and range of ff vector
### Aliases: min.ff max.ff range.ff

### ** Examples

x <- ff(1:100)

min(x)
max(x)
range(x)

is.na(x) <- 10
min(x)
max(x)
range(x)


min(x, na.rm=TRUE)
max(x, na.rm=TRUE)
range(x, na.rm=TRUE)



