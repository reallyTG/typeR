library(anyLib)


### Name: anyLib
### Title: Install and load any library
### Aliases: anyLib

### ** Examples

# Install and load 1 package from a local source file, which name is in an object:
lib <- normalizePath(tempdir(), "/")
listOfPackages <- system.file("dummyPackage_0.1.0.tar.gz", package="anyLib")
anyLib(listOfPackages, force = TRUE, autoUpdate = FALSE, lib = lib,
loadLib = lib, source = TRUE)



