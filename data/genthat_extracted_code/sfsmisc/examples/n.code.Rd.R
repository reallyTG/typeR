library(sfsmisc)


### Name: n.code
### Title: Convert "Round" Integers to Short Strings and Back
### Aliases: n.code code2n
### Keywords: utilities

### ** Examples

n10 <-  c(10,20,90, 100,500, 2000,10000)
(c10 <- n.code(n10))#-> "1d" "2d" "9d" "1c" ..
stopifnot(code2n(c10) == n10)



