library(fwdmsa)


### Name: plot.fs.n1.class
### Title: Plot fs.n1.class objects
### Aliases: plot.fs.n1.class
### Keywords: aplot

### ** Examples

## Not run: 
##D ## Retrieve data (588 observations)
##D   data(acs)
##D 
##D # Determine n1 by running the Forward Search for Mokken scale analysis
##D # B=100 times 
##D   fwdmsa.res.n1 <- fs.MSA.n1(acs, B=100)
##D 
##D # Plot of number unique subsamples
##D   plot(fwdmsa.res.n1)
##D 
##D # Plot of number of subsamples not belonging to largest unique subsample (majority)
##D   plot(fwdmsa.res.n1,n1.type="major")
## End(Not run)



