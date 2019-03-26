library(rDotNet)


### Name: .cinit
### Title: Initialize R <-> .NET bridge
### Aliases: .cinit

### ** Examples

## Not run: 
##D 
##D ## create .NET bridge server, loading personal library to be referenced in the R session
##D .cinit (dll="~/Dev/MyLibrary.dll")
##D obj <- .cnew("NormalDistribution1D", 0.0, 1.0)
##D 
##D ## alternative without explicit initialization
##D Sys.setenv(rDotNet_DLL="~/Dev/models.dll")
##D ...
##D obj <- .cnew("NormalDistribution1D", 0.0, 1.0)
##D 
## End(Not run)


