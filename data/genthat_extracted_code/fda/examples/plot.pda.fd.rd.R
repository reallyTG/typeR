library(fda)


### Name: plot.pda.fd
### Title: Plot Principle Differential Analysis Components
### Aliases: plot.pda.fd
### Keywords: smooth

### ** Examples


#  A pda analysis of the handwriting data

# reduce the size to reduce the compute time for the example
ni <- 281
indx <- seq(1, 1401, length=ni)
fdaarray <- handwrit[indx,,]
fdatime  <- seq(0, 2.3, len=ni)

#  basis for coordinates

fdarange <- c(0, 2.3)
breaks   <- seq(0,2.3,length.out=116)
norder   <- 6
fdabasis <- create.bspline.basis(fdarange,norder=norder,breaks=breaks)

#  parameter object for coordinates

fdafd0 <- fd(matrix(0,fdabasis$nbasis,1), fdabasis)
fdaPar <- fdPar(fdafd0,int2Lfd(4),1e-8)

#  coordinate functions and a list tontaining them

Xfd <- smooth.basis(fdatime, fdaarray[,,1], fdaPar)$fd
Yfd <- smooth.basis(fdatime, fdaarray[,,2], fdaPar)$fd

xfdlist <- list(Xfd, Yfd)

#  basis and parameter object for weight functions

fdabasis2 <- create.bspline.basis(fdarange,norder=norder,nbasis=31)
fdafd0    <- fd(matrix(0,fdabasis2$nbasis,1), fdabasis2)
pdaPar    <- fdPar(fdafd0,1,1e-8)

pdaParlist <- list(pdaPar, pdaPar)

bwtlist <- list( list(pdaParlist,pdaParlist), list(pdaParlist,pdaParlist) )

#  do the second order pda

pdaList <- pda.fd(xfdlist, bwtlist)

# plot the results

plot(pdaList,whichdim=1)
plot(pdaList,whichdim=2)
plot(pdaList,whichdim=3)

plot(pdaList,whichdim=c(1,2))
plot(pdaList,whichdim=c(1,3))
plot(pdaList,whichdim=c(2,3))

plot(pdaList,whichdim=1:3)



