library(plyr)


### Name: daply
### Title: Split data frame, apply function, and return results in an
###   array.
### Aliases: daply
### Keywords: manip

### ** Examples

daply(baseball, .(year), nrow)

# Several different ways of summarising by variables that should not be
# included in the summary

daply(baseball[, c(2, 6:9)], .(year), colwise(mean))
daply(baseball[, 6:9], .(baseball$year), colwise(mean))
daply(baseball, .(year), function(df) colwise(mean)(df[, 6:9]))



