library(oce)


### Name: oceFilter
### Title: Filter a time-series
### Aliases: oceFilter oce.filter

### ** Examples


library(oce)
par(mar=c(4, 4, 1, 1))
b <- rep(1, 5)/5
a <- 1
x <- seq(0, 10)
y <- ifelse(x == 5, 1, 0)
f1 <- oceFilter(y, a, b)
plot(x, y, ylim=c(-0, 1.5), pch="o", type='b')
points(x, f1, pch="x", col="red")

# remove the phase lag
f2 <- oceFilter(y, a, b, TRUE)
points(x, f2, pch="+", col="blue")

legend("topleft", col=c("black","red","blue"), pch=c("o","x","+"),
       legend=c("data","normal filter", "zero-phase filter"))
mtext("note that normal filter rolls off at end")





