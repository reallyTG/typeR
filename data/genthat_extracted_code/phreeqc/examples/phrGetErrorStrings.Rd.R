library(phreeqc)


### Name: phrGetErrorStrings
### Title: Retrieve error string messages.
### Aliases: phrGetErrorStrings

### ** Examples


# loaddatabase should fail
n <- try(phrLoadDatabase("missing.dat"), silent = TRUE)
# if n is non-NULL display error string
if (!is.null(n)) phrGetErrorStrings()




