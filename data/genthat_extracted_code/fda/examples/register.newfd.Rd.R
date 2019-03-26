library(fda)


### Name: register.newfd
### Title: Register Functional Data Objects with Pre-Computed Warping
###   Functions
### Aliases: register.newfd
### Keywords: smooth

### ** Examples


# Register the lip data with landmark registration, then register the first
# derivatives with the pre-computed warping functions.

# Lip data:
lipfd <- smooth.basisPar(liptime, lip, 6, Lfdobj=int2Lfd(4),
                         lambda=1e-12)$fd
names(lipfd$fdnames) <- c("time(seconds)", "replications", "mm")

# Landmark Registration:

lipmeanmarks <- apply(lipmarks,2,mean)

wnbasis <- 6
wnorder <- 4
wbreaks <- c(0,lipmeanmarks,0.35)

warpbasis <- create.bspline.basis(nbasis=wnbasis, norder=wnorder,
                                  breaks=wbreaks);
WfdPar    <- fdPar(fd(basisobj=warpbasis), 2, 1e-4)

lipreglist <- landmarkreg(lipfd, as.matrix(lipmarks), lipmeanmarks, WfdPar)

# And warp:

Dlipfd = deriv.fd(lipfd,Lfdobj=1)

Dlipregfd = register.newfd(Dlipfd,lipreglist$warpfd,type='direct')



