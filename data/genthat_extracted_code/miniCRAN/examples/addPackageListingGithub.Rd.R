library(miniCRAN)


### Name: addPackageListingGithub
### Title: Add DESCRIPTION information from package on github.
### Aliases: addPackageListingGithub

### ** Examples

# Create package database
pdb <- cranJuly2014

## Not run: 
##D   pdb <- pkgAvail(repos = c(CRAN = getOption("minicran.mran")))
##D 
##D   # Overwrite pdb with development version of miniCRAN at github
##D   newpdb <- addPackageListingGithub(pdb = pdb, "andrie/miniCRAN")
##D   newpdb["miniCRAN", ]
##D 
##D   # Add package from github that's not currently on CRAN
##D   newpdb <- addPackageListingGithub(pdb = pdb, repo = "RevolutionAnalytics/checkpoint")
##D   newpdb["checkpoint", ]
##D 
##D   set.seed(1)
##D   plot(makeDepGraph("checkpoint", availPkgs = newpdb, suggests = TRUE))
## End(Not run)



