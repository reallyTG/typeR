library(qtl)


### Name: add.threshold
### Title: Add significance threshold to plot
### Aliases: add.threshold
### Keywords: hplot

### ** Examples

data(hyper)
hyper <- calc.genoprob(hyper)
out <- scanone(hyper, method="hk")
operm <- scanone(hyper, method="hk", n.perm=100, perm.Xsp=TRUE)

plot(out, chr=c(1,4,6,15,"X"))
add.threshold(out, chr=c(1,4,6,15,"X"), perms=operm, alpha=0.05)
add.threshold(out, chr=c(1,4,6,15,"X"), perms=operm, alpha=0.1,
              col="green", lty=2)



