library(hoa)


### Name: venice
### Title: Sea Level Data
### Aliases: venice
### Keywords: datasets

### ** Examples

data(venice)
attach(venice)
#
plot(sea ~ year, ylab = "sea level")
##
Year <- 1:51/51
venice.l <- rsm(sea ~ Year + I(Year^2), family = extreme)
lines(year, fitted(venice.l))
##
c11 <- cos(2*pi*1:51/11) ; s11 <- sin(2*pi*1:51/11)
c19 <- cos(2*pi*1:51/18.62) ; s19 <- sin(2*pi*1:51/18.62)
venice.p <- rsm(sea ~ Year + I(Year^2) + c11 + s11 + c19 + s19, 
                family = extreme)
lines(year, fitted(venice.p), col = "red")
##
detach()



