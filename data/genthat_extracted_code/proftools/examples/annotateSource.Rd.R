library(proftools)


### Name: annotateSource
### Title: Annotate Source Files
### Aliases: annotateSource
### Keywords: programming utilities

### ** Examples

## This defines the function rw()
source(system.file("samples", "rw.R", package="proftools"))

## Execute the function and collect profile data
Rprof(tmp <- tempfile(), gc.profiling = TRUE, line.profiling = TRUE)
w <- rw(200000)
Rprof(NULL)
pd <- readProfileData(tmp)
unlink(tmp)

## Annotate the sources
annotateSource(pd)



