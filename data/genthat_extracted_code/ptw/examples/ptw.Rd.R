library(ptw)


### Name: ptw
### Title: Parametric Time Warping
### Aliases: ptw print.ptw summary.ptw coef.ptw stptw print.stptw
###   summary.stptw
### Keywords: manip

### ** Examples

data(gaschrom)
ref <- gaschrom[1,]
samp <- gaschrom[16,]
gaschrom.ptw <- ptw(ref, samp)
summary(gaschrom.ptw)

## same with sticks (peak lists)
refst <- gaschrom.st[1]
sampst <- gaschrom.st[16]
gaschrom.st.ptw <- stptw(refst, sampst, trwdth = 100)
summary(gaschrom.st.ptw)

## Not run: 
##D ## comparison between backward and forward warping
##D gaschrom.ptw <- ptw(ref, samp, init.coef = c(0, 1, 0, 0), mode = "backward")
##D summary(gaschrom.ptw)
##D gaschrom.ptw <- ptw(ref, samp, init.coef = c(-10, 1, 0, 0), mode = "forward")
##D summary(gaschrom.ptw)
##D 
##D ## #############################
##D ## many samples warped on one reference
##D ref <- gaschrom[1,]
##D samp <- gaschrom[2:16,]
##D gaschrom.ptw <- ptw(ref, samp, warp.type = "individual", verbose = TRUE,
##D                     optim.crit = "RMS", init.coef = c(0, 1, 0, 0))
##D summary(gaschrom.ptw)
##D 
##D ## "individual" warping not implemented for sticks; do separate warpings
##D ## instead
##D refst <- gaschrom.st[1]
##D sampst <- gaschrom.st[2:16]
##D gaschrom.st.ptw.list <- lapply(sampst,
##D                                function(smpl)
##D                                stptw(refst, list(smpl), trwdth = 100))
##D t(sapply(gaschrom.st.ptw.list, coef))
##D 
##D ## #############################
##D ## several samples on several references individually
##D ref <- gaschrom[1:8,]
##D samp <- gaschrom[9:16,]
##D gaschrom.ptw <- ptw(ref, samp, warp.type = "individual",
##D                     optim.crit = "RMS", init.coef = c(0, 1, 0, 0))
##D summary(gaschrom.ptw)
##D 
##D ## stick version
##D gaschrom.st.ptw.list <-
##D   mapply(function(x, y)
##D          stptw(list(x), list(y), trwdth = 100),
##D          gaschrom.st[1:8], gaschrom.st[9:16],
##D          SIMPLIFY = FALSE)
##D t(sapply(gaschrom.st.ptw.list, coef))
##D 
##D gaschrom.ptw <- ptw(ref, samp, warp.type = "global",
##D                     optim.crit = "WCC", init.coef = c(0, 1, 0))
##D summary(gaschrom.ptw)
##D 
##D ## #############################
##D ## several samples on several references: one, global warping
##D refst <- gaschrom.st[1:8]
##D sampst <- gaschrom.st[9:16]
##D gaschrom.st.ptw <- stptw(refst, sampst, trwdth=100, init.coef = c(0, 1, 0))
##D summary(gaschrom.st.ptw)
## End(Not run)

## #############################
## Example of a three-way data set
# first bring all samples to the same scale
data(lcms)
## Not run: 
##D lcms.scaled <- aperm(apply(lcms, c(1,3), 
##D                            function(x) x/mean(x) ), c(2,1,3))
##D # add zeros to the start and end of the chromatograms
##D lcms.s.z <- aperm(apply(lcms.scaled, c(1,3), 
##D                         function(x) padzeros(x, 250) ), c(2,1,3))
##D 
##D 
##D # define a global 2nd degree warping
##D warp1 <- ptw(lcms.s.z[,,2], lcms.s.z[,,3], warp.type="global")
##D warp.samp <- warp1$warped.sample
##D warp.samp[is.na(warp.samp)] <- 0
##D # refine by adding 5th degree warpings for individual chromatograms
##D warp2 <- ptw(lcms.s.z[,,2], warp.samp, init.coef=c(0,1,0,0,0,0))
##D warp.samp2 <- warp2$warped.sample
##D warp.samp2[is.na(warp.samp2)] <- 0
##D # compare TICs
##D layout(matrix(1:2,2,1, byrow=TRUE))
##D plot(colSums(lcms.s.z[,,2]), type="l", ylab = "",
##D      main = "TIC: original data")
##D lines(colSums(lcms.s.z[,,3]), col=2, lty=2)
##D plot(colSums(lcms.s.z[,,2]), type="l", ylab = "",
##D      main = "TIC: warped data")
##D lines(colSums(warp.samp2), lty=2, col=2)
## End(Not run)

## ###########################
## stick version of this warping - note that the peaks have been picked
## from the scaled profiles. Note that here we need to take list
## elements: every sample is a list of mz channels.
warp1.st <- stptw(lcms.pks[[2]], lcms.pks[[3]], trwdth = 100)
summary(warp1.st)



