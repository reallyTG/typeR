library(tuple)


### Name: matchNone
### Title: Return a Symbol That Matches No Values
### Aliases: matchNone

### ** Examples

my.x <- c(1,2,3,2,3,1,2)
matchNone(my.x)
matchNone(c(my.x,"."))
matchNone(c(my.x,".","!"))
matchNone(c(my.x,".","!","/"))
matchNone(c(my.x,".","!","/",".."))
matchNone(table = ".")



