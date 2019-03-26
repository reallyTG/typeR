library(erah)


### Name: setAlPar
### Title: Set Alignment Parameters
### Aliases: setAlPar

### ** Examples


# The following will set eRah for aligning compounds which are
# at least 90 (per cent) similar, and which peaks are at a 
# maximum distance of 2 seconds. All the masses are considered when
# computing the spectral similarity.

ex.al.par <- setAlPar(min.spectra.cor=0.90, max.time.dist=2, mz.range=1:600)




