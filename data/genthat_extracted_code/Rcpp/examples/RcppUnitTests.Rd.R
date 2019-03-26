library(Rcpp)


### Name: RcppUnitTests
### Title: Rcpp : unit tests results
### Aliases: RcppUnitTests
### Keywords: programming

### ** Examples

# unit tests are in the unitTests directory of the package
list.files( system.file("unitTests", package = "Rcpp" ),
	pattern = "^runit", full = TRUE )

# trigger the unit tests preparation, follow printed instructions
# on how to run them
## Not run: 
##D source( system.file("unitTests", "runTests.R", package = "Rcpp" ) )
## End(Not run)



