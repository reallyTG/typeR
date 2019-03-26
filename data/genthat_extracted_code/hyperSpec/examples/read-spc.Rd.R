library(hyperSpec)


### Name: read.spc
### Title: Import for Thermo Galactic's spc file format These functions
###   allow to import Thermo Galactic/Grams .spc files.
### Aliases: read.spc
### Keywords: IO file

### ** Examples


## get the sample .spc files from ftirsearch.com (see above)
## Not run: 
##D # single spectrum
##D spc <- read.spc ("BENZENE.SPC")
##D plot (spc)
##D 
##D # multi-spectra .spc file with common wavelength axis
##D spc <- read.spc ('IG_MULTI.SPC')
##D spc
##D 
##D # multi-spectra .spc file with individual wavelength axes
##D spc <- read.spc ("BARBITUATES.SPC")
##D plot (spc [[1]], lines.args = list (type = "h"))
## End(Not run)




