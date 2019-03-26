library(xts)


### Name: rbind.xts
### Title: Concatenate Two or More xts Objects by Row
### Aliases: rbind.xts c.xts
### Keywords: utilities

### ** Examples

x <- xts(1:10, Sys.Date()+1:10)
str(x)

merge(x,x)
rbind(x,x)
rbind(x[1:5],x[6:10])

c(x,x)

# this also works on non-unique index values
x <- xts(rep(1,5), Sys.Date()+c(1,2,2,2,3))
y <- xts(rep(2,3), Sys.Date()+c(1,2,3))

# overlapping indexes are appended
rbind(x,y)
rbind(y,x)




