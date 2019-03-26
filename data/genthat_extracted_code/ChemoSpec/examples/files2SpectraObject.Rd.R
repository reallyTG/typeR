library(ChemoSpec)


### Name: files2SpectraObject
### Title: Import Data into a Spectra Object
### Aliases: files2SpectraObject matrix2SpectraObject
### Keywords: file import

### ** Examples

## Not run: 
##D # Grab an included file
##D ed <- system.file("extdata", package = "ChemoSpec")
##D tf <- "PCRF.jdx"
##D chk <- file.copy(from = file.path(ed, tf), to = file.path(getwd(), tf),
##D 	overwrite = TRUE)
##D 
##D # Now read in the file, and plot
##D spec <- files2SpectraObject(gr.crit = "PCRF", freq.unit = "ppm", int.unit = "intensity",
##D   descrip = "test import", fileExt = "\\.jdx")
##D sumSpectra(spec)
##D plotSpectra(spec, lab.pos = 3.5, main = "Reduced Fat Potato Chip")
## End(Not run)




