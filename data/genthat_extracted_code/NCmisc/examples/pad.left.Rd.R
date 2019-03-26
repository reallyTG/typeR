library(NCmisc)


### Name: pad.left
### Title: Print a vector with appropriate padding so each has equal char
###   length.
### Aliases: pad.left

### ** Examples

pad.left(1:10)
phone.numbers <- c("07429719234","7876345123","7123543765")
pad.left(phone.numbers,"0")
pad.left(rnorm(10),numdigits=3)



