library(miniCRAN)


### Name: makeRepo
### Title: Downloads packages from CRAN to specified path and creates a
###   local repository.
### Aliases: makeRepo updateRepoIndex

### ** Examples


# Specify list of packages to download
revolution <- c(CRAN = getOption("minicran.mran"))
pkgs <- c("foreach")

pdb <- cranJuly2014

## Not run: 
##D   pdb <- pkgAvail(
##D     repos = c(CRAN = getOption("minicran.mran")),
##D     type = "source"
##D   )
## End(Not run)

pkgList <- pkgDep(pkgs, availPkgs = pdb, repos = revolution, type = "source", suggests = FALSE)
pkgList


## Not run: 
##D # Create temporary folder for miniCRAN
##D dir.create(pth <- file.path(tempdir(), "miniCRAN"))
##D 
##D # Make repo for source and win.binary
##D makeRepo(pkgList, path = pth, repos = revolution, type = "source")
##D 
##D # List all files in miniCRAN
##D list.files(pth, recursive = TRUE)
##D 
##D # Check for available packages
##D pkgAvail(repos = pth, type = "source")
##D 
##D # Repeat process for windows binaries
##D makeRepo(pkgList, path = pth, repos = revolution, type = "win.binary")
##D pkgAvail(repos = pth, type = "win.binary")
##D 
##D # Delete temporary folder
##D unlink(pth, recursive = TRUE)
## End(Not run)



