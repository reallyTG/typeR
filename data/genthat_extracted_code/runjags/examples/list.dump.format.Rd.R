library(runjags)


### Name: dump.format
### Title: Conversion Between a Named List and a Character String in the R
###   Dump Format
### Aliases: dump.format list.format
### Keywords: methods

### ** Examples


# A named list:
namedlist1 <- list(N=10, Count=c(4,2,7,0,6,9,1,4,12,1))

# Conver to a character vector:
chardata <- dump.format(namedlist1)

# And back to a named list:
namedlist2 <- list.format(chardata)

# These should be the same:
stopifnot(identical(namedlist1, namedlist2))




