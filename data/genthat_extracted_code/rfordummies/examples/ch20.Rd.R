library(rfordummies)


### Name: ch20
### Title: Print examples of chapter 20 of 'R for Dummies'.
### Aliases: ch20

### ** Examples

# Chapter 20 - Ten Tips on Working with Packages

## Poking Around the Nooks and Crannies of CRAN

options("repos" = c(CRAN = "http://cran.ma.imperial.ac.uk/"))

## Finding Interesting Packages

## Installing Packages

## Not run: 
##D install.packages("fortunes")
## End(Not run)

## Loading Packages

library("fortunes")

## Reading the Package Manual and Vignette

library(help=fortunes)
## Not run: 
##D vignette("fortunes")
## End(Not run)

## Updating Packages

## Not run: 
##D update.packages()
## End(Not run)

## Unloading Packages

search()
detach(package:fortunes, unload=TRUE)

## Forging Ahead with R-Forge

## Not run: 
##D install.packages("data.table", repos="http://R-Forge.R-project.org")
## End(Not run)

## Conducting Installations from BioConductor

## Not run: 
##D source("http://bioconductor.org/biocLite.R")
## End(Not run)

## Reading the R Manual




