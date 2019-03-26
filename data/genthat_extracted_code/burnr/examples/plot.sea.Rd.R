library(burnr)


### Name: plot.sea
### Title: Plot a sea object.
### Aliases: plot.sea

### ** Examples

## Not run: 
##D # Read in the Cook and Krusic (2004; The North American Drought Atlas) reconstruction
##D # of Palmer Drought Severity Index (PDSI) for the Jemez Mountains area (gridpoint 133).
##D 
##D data(pgm_pdsi)
##D 
##D # Run SEA on Peggy Mesa (pgm) data
##D data(pgm)
##D pgm_comp <- composite(pgm)
##D 
##D pgm_sea <- sea(pgm_pdsi, pgm_comp)
##D 
##D plot(pgm_sea)
## End(Not run)



