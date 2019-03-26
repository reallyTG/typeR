library(webmockr)


### Name: HashCounter
### Title: hash with counter, to store requests, and count each time it is
###   used
### Aliases: HashCounter
### Keywords: datasets

### ** Examples

x <- HashCounter$new()
x$put("foo bar")
x$put("foo bar")
x$put("hello world")
x$put("hello world")
x$put("hello world")
x$hash



