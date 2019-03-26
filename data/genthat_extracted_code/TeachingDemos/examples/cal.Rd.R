library(TeachingDemos)


### Name: cal
### Title: Plot a month or year calendar
### Aliases: cal
### Keywords: hplot chron ts

### ** Examples

cal(2011)

cal('May')

setday <- cal(11, 2011)

setday(3)
text(0.5,0.5, 'Some\nCentered\nText')

setday(8)
text(1,1,'Top Right',adj=c(1,1))

setday(18)
text(0,0,'Bottom Left', adj=c(0,0) )

setday(21)
tmp.x <- runif(25)
tmp.y <- rnorm(25, tmp.x, .1)
mrgn.x <- 0.04*diff(range(tmp.x))
mrgn.y <- 0.04*diff(range(tmp.y))
updateusr( 0:1, 0:1, range(tmp.x)+c(-1,1)*mrgn.x, range(tmp.y)+c(-1,1)*mrgn.y)
points(tmp.x, tmp.y)

setday(30)
tmp <- hist(rnorm(100), plot=FALSE)
updateusr( 0:1, 0:1, range(tmp$breaks), range(tmp$counts*1.1,0) )
lines(tmp)



