library(miniCRAN)


### Name: updatePackages
### Title: Check for available package updates in a miniCRAN repo.
### Aliases: updatePackages oldPackages updatePackages

### ** Examples

### `oldPackages` and `updatePackages` require an existing miniCRAN repo

# Specify list of packages to download
revolution <- c(CRAN = getOption("minicran.mran"))
pkgs <- c("foreach")

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
##D   # create the miniCRAN directory structure but only add bin files
##D   makeRepo(pkgList, path = pth, repos = revolution, type = "source", download = FALSE)
##D   makeRepo(pkgList, path = pth, repos = revolution, type = "win.binary", download = TRUE)
##D 
##D   # download old source package version and create repo index
##D   oldVers <- data.frame(package = c("foreach", "codetools", "iterators"),
##D                         version = c("1.4.0", "0.2-7", "1.0.5"),
##D                         stringsAsFactors = FALSE)
##D   addOldPackage(pkgList, path = pth, repos = revolution, vers = oldVers$version, type = "source")
##D   # NOTE: older binary versions would need to be build from source
##D 
##D   # Check if updated packages are available
##D   oldPackages(path = pth, repos = revolution, type = "source") # should need update
##D   oldPackages(path = pth, repos = revolution, type = "win.binary") # should be current
##D 
##D   # Update available packages
##D   updatePackages(path = pth, repos = revolution, type = "source", ask = FALSE) # should need update
##D   updatePackages(path = pth, repos = revolution, type = "win.binary") # should be current
##D 
##D   # Delete temporary folder
##D   unlink(pth, recursive = TRUE)
## End(Not run)



