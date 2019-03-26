library(popEpi)


### Name: fac2num
### Title: Convert factor variable to numeric
### Aliases: fac2num

### ** Examples

## this is often not intended
as.numeric(factor(c(5,7))) ## result: c(1,2)
## but this
fac2num(factor(c(5,7))) ## result: c(5,7)

## however
as.numeric(factor(c("5","7","a"))) ## 1:3

fac2num(factor(c("5","7","a"))) ## result: c(5,7,NA) with warning





