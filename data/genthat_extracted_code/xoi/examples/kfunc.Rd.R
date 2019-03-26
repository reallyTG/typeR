library(xoi)


### Name: kfunc
### Title: estimate Ripley's K function
### Aliases: kfunc
### Keywords: models

### ** Examples

L <- 103
n <- 2000
map1 <- sim.map(L, n.mar=104, anchor=TRUE, include.x=FALSE, eq=TRUE)
x <- sim.cross(map1, n.ind=n, m=6, type="bc")

xoloc <- find.breaks(x)

d <- seq(0, 100, by=0.1)[-1]
kf <- kfunc(xoloc, d=d, lengths=rep(L, n))

plot(k ~ d, data=kf, type="n", yaxs="i", xaxs="i", las=1,
     ylim=c(0, max(kf$k + kf$se)))
polygon(c(kf$d, rev(kf$d)), c(kf$k + kf$se, rev(kf$k-kf$se)),
        border=NA, col="#add8e650")
lines(k ~ d, data=kf)




