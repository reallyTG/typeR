library(R.utils)


### Name: System$parseDebian
### Title: Parses a string, file or connection for Debian formatted
###   parameters
### Aliases: System$parseDebian parseDebian.System System.parseDebian
###   parseDebian,System-method
### Keywords: internal methods

### ** Examples

 file <- file.path(Package("R.utils")$path, "DESCRIPTION")
 l <- System$parseDebian(file=file)
 print(l)



