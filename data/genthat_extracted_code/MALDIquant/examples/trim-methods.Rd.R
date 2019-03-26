library(MALDIquant)


### Name: trim-methods
### Title: Trim an AbstractMassObject object.
### Aliases: trim trim,AbstractMassObject,numeric-method
###   trim,list,numeric-method trim,list,missing-method
### Keywords: methods

### ** Examples

## load package
library("MALDIquant")

## load example data
data("fiedler2009subset", package="MALDIquant")

## select only one spectrum
s <- fiedler2009subset[[1]]

## remove all mass lower 3000
trim(s, range=c(3000, Inf))

## remove all mass higher 8000
trim(s, range=c(0, 8000))

## remove all mass lower 3000 and higher 8000
trim(s, range=c(3000, 8000))

## choose largest overlapping mass range for all spectra
trim(fiedler2009subset)



