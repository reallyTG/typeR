library(ade4)


### Name: microsatt
### Title: Genetic Relationships between cattle breeds with microsatellites
### Aliases: microsatt
### Keywords: datasets

### ** Examples

## Not run: 
##D data(microsatt)
##D fac <- factor(rep(microsatt$loci.names, microsatt$loci.eff))
##D w <- dudi.coa(data.frame(t(microsatt$tab)), scann = FALSE)
##D wit <- wca(w, fac, scann = FALSE)
##D microsatt.ktab <- ktab.within(wit)
##D 
##D plot(sepan(microsatt.ktab)) # 9 separated correspondence analyses
##D plot(mcoa(microsatt.ktab, scan = FALSE))
##D plot(mfa(microsatt.ktab, scan = FALSE))
##D plot(statis(microsatt.ktab, scan = FALSE))
## End(Not run)


