library(calibrate)


### Name: shiftvector
### Title: Compute a shift vector for a calibrated axis.
### Aliases: shiftvector
### Keywords: multivariate

### ** Examples

X <- matrix(rnorm(100),ncol=2)
Xs <- scale(X)

g <- c(1,1)

plot(Xs[,1],Xs[,2],asp=1,pch=19)
textxy(Xs[,1],Xs[,2],1:nrow(X))

arrows(0,0,g[1],g[2])
text(g[1],g[2],"g",pos=1)

out <- shiftvector(g,X,verbose=TRUE)
dr <- out$dr
dl <- out$dl

arrows(0,0,dl[1],dl[2])
text(dl[1],dl[2],"dl",pos=1)

arrows(0,0,dr[1],dr[2])
text(dr[1],dr[2],"dr",pos=1)



