library(sfsmisc)


### Name: Sys.ps
### Title: Return Process Status (Unix 'ps') Information
### Aliases: Sys.ps Sys.sizes
### Keywords: utilities

### ** Examples

(.pid <- Sys.getpid()) ## process ID of current process
Sys.sizes(.pid)

## The default process statistics about the running R process
try( Sys.ps() )



