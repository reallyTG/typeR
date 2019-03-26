library(toOrdinal)


### Name: toOrdinal
### Title: Cardinal to ordinal number conversion function
### Aliases: toOrdinal
### Keywords: misc models

### ** Examples

toOrdinal(1)  ## 1st
toOrdinal(1, language="French") ## 1re

sapply(1:20, toOrdinal) ## 1st, 2nd, 3rd, ...
sapply(1:20, toOrdinal, language="French") ## 1re, 2e, 3e, ...



