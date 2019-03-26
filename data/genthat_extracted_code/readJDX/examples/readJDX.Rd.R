library(readJDX)


### Name: readJDX
### Title: Import a File Written in the JCAMP-DX Format
### Aliases: readJDX

### ** Examples

sbo <- system.file("extdata", "SBO.jdx", package = "readJDX")
chk <- readJDX(sbo)
plot(chk[[4]]$x, chk[[4]]$y/100, type = "l", main = "Original Smart Balance Spread",
	xlab = "wavenumber", ylab = "Percent Transmission")

pcrf <- system.file("extdata", "PCRF.jdx", package = "readJDX")
chk <- readJDX(pcrf)
plot(chk[[4]]$x, chk[[4]]$y, type = "l", main = "Reduced Fat Potato Chip Extract",
	xlab = "ppm", ylab = "Intensity")

## Not run: 
##D # Line 265 has an N -> G typo.  Try with various levels of debug.
##D # Even with debug = 0 you get useful diagnostic info.
##D problem <- system.file("extdata", "PCRF_line265.jdx", package = "readJDX")
##D chk <- readJDX(problem)
## End(Not run)




