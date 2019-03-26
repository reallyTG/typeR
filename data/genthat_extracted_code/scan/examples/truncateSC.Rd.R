library(scan)


### Name: truncateSC
### Title: Truncate single-case data
### Aliases: truncateSC
### Keywords: manip

### ** Examples

# Truncate the first two data points of both phases and compare the two data sets
truHeart <- truncateSC(byHeart2011[1], A = c(2,0), B = c(2,0))
plotSC(c(original = byHeart2011[1], selected = truHeart))



