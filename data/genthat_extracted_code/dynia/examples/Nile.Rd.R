library(dynia)


### Name: Nile
### Title: Annual FLow of Nile River at Aswan, 1871-1945
### Aliases: Nile
### Keywords: datasets

### ** Examples

data(Nile)
plot(Nile, type="b",xlab="year", ylab="Nile Flow River")
lines(window(Nile,start=c(1870),end=c(1902)), lwd=2, col="black")
segments(1903,0,1902,5000,col="red",lty=1, lwd=3)



