library(assertthat)


### Name: assert-is
### Title: Missing is functions.
### Aliases: is.error is.time is.date

### ** Examples

a <- Sys.time()
is.time(a)
b <- Sys.Date()
is.date(b)
c <- try(stop("!!"))
is.error(c)



