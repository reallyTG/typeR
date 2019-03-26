library(UsingR)


### Name: simple.eda.ts
### Title: Makes 3 useful graphs for eda of times series
### Aliases: simple.eda.ts
### Keywords: univar

### ** Examples

## The function is currently defined as

## look for no correlation
x <- rnorm(100);simple.eda.ts(x)
## you will find correlation here
simple.eda.ts(cumsum(x))



