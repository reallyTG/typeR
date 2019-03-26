library(rbundler)


### Name: create_mock_packages
### Title: Creates a series of mock packages, useful for testing and
###   experimentation.
### Aliases: create_mock_packages

### ** Examples

path <- tempdir()
repos <- 'http://cran.rstudio.com'
dependency <- mock_dependency('RCurl', repos)
create_mock_packages(path, dependency, repos)



