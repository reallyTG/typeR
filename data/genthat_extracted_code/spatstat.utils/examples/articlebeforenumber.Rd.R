library(spatstat.utils)


### Name: articlebeforenumber
### Title: Indefinite Article Preceding A Number
### Aliases: articlebeforenumber
### Keywords: manip utilities

### ** Examples

  f <- function(k) cat(paste(articlebeforenumber(k),
                       paste0(k, "-fold"),
                       "increase\n"))
  f(8)
  f(18)
  f(28)



