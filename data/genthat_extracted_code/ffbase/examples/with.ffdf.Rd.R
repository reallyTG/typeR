library(ffbase)


### Name: with.ffdf
### Title: Evaluate an expression in a ffdf data environment
### Aliases: with.ffdf

### ** Examples

dat <- data.frame(x=1:10, y=10:1)

ffdat <- as.ffdf(dat)

with(ffdat, {x+y})



