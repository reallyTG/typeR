library(scriptests)


### Name: runtests
### Title: Interactively run some Rt test files in a package
### Aliases: runtests dumprout
### Keywords: misc

### ** Examples

## Not run: 
##D > # To run like this example, set the current working directory
##D > # to where the package code lives.
##D > # source.pkg() reads in the functions -- could just as well
##D > # load the library, but source.pkg() can be more convenient
##D > # when developing a package.
##D > source.pkg("scriptests")
##D Reading 5 .R files into env at pos 2: 'pkgcode:scriptests'
##D Sourcing scriptests/R/createRfromRt.R
##D Sourcing scriptests/R/interactive.R
##D Sourcing scriptests/R/oldcode.R
##D Sourcing scriptests/R/plus.R
##D Sourcing scriptests/R/rttests.R
##D list()
##D > runtests("simple1")
##D Running tests in scriptests/tests/simple1.Rt (read 4 chunks)
##D ....
##D Ran 4 tests with 0 errors and 0 warnings from scriptests/tests/simple1.Rt
##D > runtests("simple2")
##D Running tests in scriptests/tests/simple2.Rt (read 5 chunks)
##D .....
##D Ran 5 tests with 0 errors and 0 warnings from scriptests/tests/simple2.Rt
##D > runtests("simple")
##D Running tests in scriptests/tests/simple1.Rt (read 4 chunks)
##D ....
##D Ran 4 tests with 0 errors and 0 warnings from scriptests/tests/simple1.Rt
##D Running tests in scriptests/tests/simple2.Rt (read 5 chunks)
##D .....
##D Ran 5 tests with 0 errors and 0 warnings from scriptests/tests/simple2.Rt
##D >
## End(Not run)



