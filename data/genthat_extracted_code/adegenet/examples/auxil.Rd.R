library(adegenet)


### Name: Auxiliary functions
### Title: Auxiliary functions for adegenet
### Aliases: checkType .rmspaces .genlab .readExt corner num2col fac2col
###   any2col transp bluepal redpal greenpal greypal flame azur seasun
###   lightseasun deepseasun spectral wasp funky virid hybridpal
### Keywords: manip

### ** Examples


.genlab("Locus-",11)

## transparent colors using "transp"
plot(rnorm(1000), rnorm(1000), col=transp("blue",.3), pch=20, cex=4)


## numeric values to color using num2col
plot(1:100, col=num2col(1:100), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=bluepal), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=flame), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=wasp), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=azur,rev=TRUE), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=spectral), pch=20, cex=4)
plot(1:100, col=num2col(1:100, col.pal=virid), pch=20, cex=4)

## factor as colors using fac2col
dat <- cbind(c(rnorm(50,8), rnorm(100), rnorm(150,3),
rnorm(50,10)),c(rnorm(50,1),rnorm(100),rnorm(150,3), rnorm(50,5)))
fac <- rep(letters[1:4], c(50,100,150,50))
plot(dat, col=fac2col(fac), pch=19, cex=4)
plot(dat, col=transp(fac2col(fac)), pch=19, cex=4)
plot(dat, col=transp(fac2col(fac,seed=2)), pch=19, cex=4)

## use of any2col
x <- factor(1:10)
col.info <- any2col(x, col.pal=funky)
plot(x, col=col.info$col, main="Use of any2col on a factor")
legend("bottomleft", fill=col.info$leg.col, legend=col.info$leg.txt, bg="white")

x <- 100:1
col.info <- any2col(x, col.pal=wasp)
barplot(x, col=col.info$col, main="Use of any2col on a numeric")
legend("bottomleft", fill=col.info$leg.col, legend=col.info$leg.txt, bg="white")




