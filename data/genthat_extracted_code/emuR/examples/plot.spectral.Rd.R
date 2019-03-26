library(emuR)


### Name: plot.spectral
### Title: Plot spectra from EMU spectral objects
### Aliases: plot.spectral
### Keywords: dplot

### ** Examples

## Not run: 
##D 
##D plot(vowlax.dft.5[1,])
##D 
##D # with label types
##D plot(vowlax.dft.5[1:20,], vowlax.l[1:20])
##D 
##D # As above but averaged after converting to power ratios.
##D plot(vowlax.dft.5[1:20,], vowlax.l[1:20], fun=mean, power=TRUE)
##D 
##D # All the spectra of one segment in a trackdata object
##D plot(fric.dft[1,])
##D 
## End(Not run)




