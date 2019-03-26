library(MASS)


### Name: denumerate
### Title: Transform an Allowable Formula for 'loglm' into one for 'terms'
### Aliases: denumerate denumerate.formula
### Keywords: models

### ** Examples

denumerate(~(1+2+3)^3 + a/b)
## which gives ~ (.v1 + .v2 + .v3)^3 + a/b



