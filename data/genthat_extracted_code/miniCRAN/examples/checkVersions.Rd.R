library(miniCRAN)


### Name: checkVersions
### Title: Check for previous versions of packages in a miniCRAN
###   repository.
### Aliases: checkVersions

### ** Examples

### `checkVersions` and `add.packages.miniCRAN` require an existing miniCRAN repo

# Specify list of packages to download
revolution <- c(CRAN = getOption("miniCRAN.mran"))
pkgs <- c("foreach")
pkgTypes <- c("source", "win.binary")

pdb <- cranJuly2014

## Not run: 
##D   pdb <- pkgAvail(repos = revolution, type = "source")
## End(Not run)

pkgList <- pkgDep(pkgs, availPkgs = pdb, repos = revolution, type = "source", suggests = FALSE)
pkgList

## Not run: 
##D   # Create temporary folder for miniCRAN
##D   dir.create(pth <- file.path(tempdir(), "miniCRAN"))
##D 
##D   # Make repo for source and win.binary
##D   makeRepo(pkgList, path = pth, repos = revolution, type = pkgTypes)
##D 
##D   # Add other versions of a package (and assume these were added previously)
##D   oldVers <- data.frame(package = c("foreach", "codetools", "iterators"),
##D                         version = c("1.4.0", "0.2-7", "1.0.5"),
##D                         stringsAsFactors = FALSE)
##D   pkgs <- oldVers$package
##D   addOldPackage(pkgs, path = pth, vers = oldVers$version, repos = revolution, type = "source")
##D   # NOTE: older binary versions would need to be build from source
##D 
##D   # List package versions in the miniCRAN repo (produces warning about duplicates)
##D   pkgVersionsSrc <- checkVersions(pkgs, path = pth, type = "source")
##D   pkgVersionsBin <- checkVersions(pkgs, path = pth, type = "win.binary")
##D 
##D   # After inspecting package versions, remove old versions
##D   basename(pkgVersionsSrc) # "foreach_1.4.0.tar.gz"  "foreach_1.4.2.tar.gz"
##D   basename(pkgVersionsBin) # "foreach_1.4.0.zip"     "foreach_1.4.2.zip"
##D   file.remove(c(pkgVersionsSrc[1], pkgVersionsBin[1]))
##D 
##D   # Rebuild package index after adding/removing files
##D   updateRepoIndex(pth, type = pkgTypes, Rversion = R.version)
##D 
##D   pkgAvail(pth, type = "source")
##D 
##D   # Add new packages (from CRAN) to the miniCRAN repo
##D   addPackage("Matrix", path = pth, repos = revolution, type = pkgTypes)
##D 
##D   # Delete temporary folder
##D   unlink(pth, recursive = TRUE)
## End(Not run)



