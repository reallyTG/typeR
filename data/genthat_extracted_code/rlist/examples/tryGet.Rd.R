library(rlist)


### Name: tryGet
### Title: Try to get the value of a symbol if exists or return a default
###   value
### Aliases: tryGet

### ** Examples

x <- list(a=c(x=1,y=2),b=c(x=2,p=3))
list.map(x, tryGet(y,0))



