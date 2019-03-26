library(inlmisc)


### Name: RecreateLibrary
### Title: Recreate R Library
### Aliases: RecreateLibrary SavePackageDetails
### Keywords: utilities

### ** Examples

# Run on old version of R
SavePackageDetails()

## Not run: 
##D # Run on new version of R, and ensure 'inlmisc' package is available.
##D repos <- c(CRAN = "https://cloud.r-project.org/", GRAN = "https://owi.usgs.gov/R")
##D if (system.file(package = "inlmisc") == "")
##D   utils::install.packages("inlmisc", repos = repos["CRAN"], dependencies = TRUE)
##D inlmisc::RecreateLibrary(repos = repos, github = TRUE)
## End(Not run)

# Clean up example
file.remove("R-packages.tsv")




