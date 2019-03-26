library(psd)


### Name: prewhiten
### Title: Prepare a series for spectral estimation
### Aliases: prewhiten prewhiten.default prewhiten.ts

### ** Examples

## Not run: 
##D #REX
##D library(psd)
##D 
##D ##
##D ## Using prewhiten to improve spectral estimates
##D ##
##D 
##D data(magnet)
##D mts <- ts(magnet$clean)
##D # add a slope
##D mts.slope <- mts + seq_along(mts)
##D 
##D # Prewhiten by removing mean+trend, and
##D # AR model; fit truncates the series by 
##D # a few terms, so zero pad
##D mts <- prewhiten(mts.slope,  AR.max=10, zero.pad="rear")
##D mts.p <- mts[['prew_lm']]
##D mts.par <- mts[['prew_ar']]
##D 
##D # uniformly-tapered spectral estimates
##D PSD <- psdcore(mts.p, ntaper=20)
##D PSD.ar <- psdcore(mts.par, ntaper=20)
##D 
##D # remove the effect of AR model
##D PSD.ar[['spec']] <- PSD.ar[['spec']] / mean(PSD.ar[['spec']])
##D PSD[['spec']] <- PSD[['spec']] / PSD.ar[['spec']]
##D 
##D plot(PSD, log='dB', lwd=2, ylim=c(-5,35))
##D plot(PSD, log='dB', add=TRUE, lwd=2, col="red")
##D plot(PSD.ar, log='dB', add=TRUE, col="blue", lwd=2)
##D 
## End(Not run)#REX



