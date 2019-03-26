library(M3)


### Name: get.datetime.seq
### Title: Read in a sequence of date-time steps from a Models3-formatted
###   file.
### Aliases: get.datetime.seq
### Keywords: chron

### ** Examples

## As mentioned in notes above, user will not typically call
## this function directly.

## Find the path to a demo file with lambert conic conformal projection.
lcc.file <- system.file("extdata/ozone_lcc.ncf", package="M3")

## Get vector containing date-times available in this file.
datetime.seq <- get.datetime.seq(lcc.file)



