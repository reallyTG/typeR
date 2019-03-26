library(squash)


### Name: prettyInt
### Title: Pretty breakpoints
### Aliases: prettyInt prettyLog
### Keywords: dplot

### ** Examples
 
##
x1 <- 1:3
pretty(x1)
prettyInt(x1)
prettyLog(x1)

## 
x2 <- pi ^ (1:8)
range(x2)
pretty(x2)
prettyLog(x2)
prettyLog(x2, n = 10)

##
x3 <- c(-x2, x2)
pretty(x3)
prettyLog(x3)
prettyLog(x3, small = 100)




