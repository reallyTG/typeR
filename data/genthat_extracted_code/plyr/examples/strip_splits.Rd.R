library(plyr)


### Name: strip_splits
### Title: Remove splitting variables from a data frame.
### Aliases: strip_splits

### ** Examples

dlply(mtcars, c("vs", "am"))
dlply(mtcars, c("vs", "am"), strip_splits)



