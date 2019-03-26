library(prodlim)


### Name: row.match
### Title: Identifying rows in a matrix or data.frame
### Aliases: row.match
### Keywords: misc

### ** Examples


tab <- data.frame(num=1:26,abc=letters)
x <- c(3,"c")
row.match(x,tab)
x <- data.frame(n=c(3,8),z=c("c","h"))
row.match(x,tab)




