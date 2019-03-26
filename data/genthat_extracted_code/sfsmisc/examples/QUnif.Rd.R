library(sfsmisc)


### Name: QUnif
### Title: Quasi Randum Numbers via Halton Sequences
### Aliases: QUnif sHalton
### Keywords: math multivariate datagen

### ** Examples

32*sHalton(20, base=2)

stopifnot(sHalton(20, base=3, leap=2) ==
          sHalton(20, base=3)[1+2*(0:9)])
## ------- a 2D Visualization -------

Uplot <- function(xy, axes=FALSE, xlab="", ylab="", ...) {
  plot(xy, xaxs="i", yaxs="i", xlim=0:1, ylim=0:1, xpd = FALSE,
       axes=axes, xlab=xlab, ylab=ylab, ...)
  box(lty=2, col="gray40")
}

do4 <- function(n, ...) {
  op <- mult.fig(4, main=paste("n =", n,": Quasi vs. (Pseudo) Random"),
                 marP=c(-2,-2,-1,0))$old.par
  on.exit(par(op))
  for(i in 1:2) {
     Uplot(QUnif(n, p=2), main="QUnif", ...)
     Uplot(cbind(runif(n), runif(n)), main="runif", ...)
  }
}
do4(100)
do4(500)
do4(1000, cex = 0.8, col="slateblue")
do4(10000, pch= ".", col="slateblue")
do4(40000, pch= ".", col="slateblue")



