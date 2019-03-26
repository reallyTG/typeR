library(soilDB)


### Name: siblings
### Title: Lookup siblings and cousins for a given soil series.
### Aliases: siblings
### Keywords: manip

### ** Examples

# basic usage
x <- siblings('zook')
x$sib

# restrict to siblings that are major components
# e.g. the most likely siblings
x <- siblings('zook', only.major = TRUE)
x$sib




