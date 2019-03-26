library(Ecfun)


### Name: read.testURLs
### Title: Read a file produced by testURLs
### Aliases: read.testURLs
### Keywords: IO

### ** Examples

# Test only 2 web sites, not the default 4,
# and test only twice, not the default 10 times:
tst <- testURLs(c(
 PVI="http://en.wikipedia.org/wiki/Cook_Partisan_Voting_Index",
 house="http://house.gov/representatives"),
    n=2, maxFail=2)

# The above should have created a file 'testURLresults.csv'
# in the working directory.  Read it.

dat <- read.testURLs()




