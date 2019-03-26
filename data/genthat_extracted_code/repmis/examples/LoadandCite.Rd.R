library(repmis)


### Name: LoadandCite
### Title: Install, load, and cite R packages
### Aliases: LoadandCite

### ** Examples

# Create vector of package names
## In this example you need to have the packages installed aready.
PackNames <- "repmis"
# Load the packages and create a BibTeX file
LoadandCite(pkgs = PackNames, file = 'PackageCites.bib', style = 'JSS')
## Not run: 
##D # Install, load, and cite specific package versions
##D # dontrun due to CRAN restrictions
##D Names <- c("e1071", "gtools")
##D Vers <- c("1.6", "2.6.1")
##D LoadandCite(pkgs = Names, versions = Vers, install = TRUE,
##D              file = "PackageCites.bib")
## End(Not run)



