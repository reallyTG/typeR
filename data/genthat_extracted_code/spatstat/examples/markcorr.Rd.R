library(spatstat)


### Name: markcorr
### Title: Mark Correlation Function
### Aliases: markcorr
### Keywords: spatial nonparametric

### ** Examples

    # CONTINUOUS-VALUED MARKS:
    # (1) Spruces
    # marks represent tree diameter
    # mark correlation function
    ms <- markcorr(spruces)
    plot(ms)

    # (2) simulated data with independent marks
    X <- rpoispp(100)
    X <- X %mark% runif(npoints(X))
    ## Not run: 
##D     Xc <- markcorr(X)
##D     plot(Xc)
##D     
## End(Not run)
    
    # MULTITYPE DATA:
    # Hughes' amacrine data
    # Cells marked as 'on'/'off'
    # (3) Kernel density estimate with Epanecnikov kernel
    # (as proposed by Stoyan & Stoyan)
    M <- markcorr(amacrine, function(m1,m2) {m1==m2},
                  correction="translate", method="density",
                  kernel="epanechnikov")
    plot(M)
    # Note: kernel="epanechnikov" comes from help(density)

    # (4) Same again with explicit control over bandwidth
    ## Not run: 
##D     M <- markcorr(amacrine, 
##D                   correction="translate", method="density",
##D                   kernel="epanechnikov", bw=0.02)
##D     # see help(density) for correct interpretation of 'bw'
##D     
## End(Not run)

   ## Don't show: 
    niets <- markcorr(amacrine, function(m1,m2){m1 == m2}, method="loess")
    if(require(sm))
      niets <- markcorr(X, correction="isotropic", method="smrep", hmult=2)
    
## End(Don't show)

   # weighted mark correlation
   Y <- subset(betacells, select=type)
   a <- marks(betacells)$area
   v <- markcorr(Y, weights=a)



