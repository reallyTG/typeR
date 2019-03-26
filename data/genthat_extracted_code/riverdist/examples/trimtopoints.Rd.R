library(riverdist)


### Name: trimtopoints
### Title: Trim a River Network to a Set of X-Y Coordinates
### Aliases: trimtopoints

### ** Examples

data(Koyukuk2)
x <- c(139241.0, 139416.1, 124600.1, 122226.8)
y <- c(1917577, 1913864, 1898723, 1898792)

plot(x=Koyukuk2)
points(x, y, pch=15, col=4)
legend(par("usr")[1], par("usr")[4], legend="points to buffer around", pch=15, col=4, cex=.6)

Koyukuk2.buf1 <- trimtopoints(x, y, rivers=Koyukuk2, method="snap")
plot(x=Koyukuk2.buf1)
points(x, y, pch=15, col=4)

Koyukuk2.buf2 <- trimtopoints(x, y, rivers=Koyukuk2, method="snaproute")
plot(x=Koyukuk2.buf2)
points(x, y, pch=15, col=4)

Koyukuk2.buf3 <- trimtopoints(x, y, rivers=Koyukuk2, method="buffer", dist=1000)
plot(x=Koyukuk2.buf3)
points(x, y, pch=15, col=4)



