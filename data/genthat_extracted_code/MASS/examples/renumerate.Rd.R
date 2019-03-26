library(MASS)


### Name: renumerate
### Title: Convert a Formula Transformed by 'denumerate'
### Aliases: renumerate renumerate.formula
### Keywords: models

### ** Examples

denumerate(~(1+2+3)^3 + a/b)
## ~ (.v1 + .v2 + .v3)^3 + a/b
renumerate(.Last.value)
## ~ (1 + 2 + 3)^3 + a/b



