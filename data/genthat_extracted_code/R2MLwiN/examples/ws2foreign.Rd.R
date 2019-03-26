library(R2MLwiN)


### Name: ws2foreign
### Title: Converts data from one format to another within MLwiN
### Aliases: ws2foreign

### ** Examples


## Not run: 
##D library(R2MLwiN)
##D # NOTE: if MLwiN not saved in location R2MLwiN defaults to, specify path via:
##D # options(MLwiN_path = 'path/to/MLwiN vX.XX/')
##D # If using R2MLwiN via WINE, the path may look like this:
##D # options(MLwiN_path = '/home/USERNAME/.wine/drive_c/Program Files (x86)/MLwiN vX.XX/')
##D 
##D wsfile = normalizePath(file.path(getOption("MLwiN_path"), "samples/tutorial.ws"), winslash = "/")
##D ## the tutorial.dta file will be saved in the temporary folder
##D inputfile = normalizePath(file.path(tempdir(), "tutorial.dta"), winslash = "/", mustWork = FALSE)
##D ws2foreign(wsfile, foreignfile = inputfile)
##D library(foreign)
##D indata = read.dta(inputfile)
##D str(indata)
##D unlink(inputfile)
## End(Not run)




