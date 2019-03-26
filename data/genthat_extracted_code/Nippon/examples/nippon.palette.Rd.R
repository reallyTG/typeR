library(Nippon)


### Name: nippon.palette
### Title: Switch the color palette to JIS colors
### Aliases: nippon.palette
### Keywords: Japanese color

### ** Examples

op <- par(mfrow=c(1,2))
palette("default")
n <- print(palette())
pie(rep(1,8),col=1:8,label=n)
nippon.palette()
pie(rep(1,8),col=1:8,label=n)
palette("default")
par(op)



