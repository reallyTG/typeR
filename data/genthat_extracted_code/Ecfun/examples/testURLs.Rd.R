library(Ecfun)


### Name: testURLs
### Title: Test URLs for intermittent download problems
### Aliases: testURLs
### Keywords: IO

### ** Examples

# Test only 2 web sites, not the default 4,
# and test only twice, not the default 10 times:
tst <- testURLs(c(
 PVI="http://en.wikipedia.org/wiki/Cook_Partisan_Voting_Index",
 house="http://house.gov/representatives"),
    n=2, maxFail=2)

## Don't show: 
stopifnot(
## End(Don't show)
(class(tst) == 'testURLs') &&
all(names(tst) == c('PVI', 'house')) &&
all(names(attributes(tst)) ==
    c('names', 'urls', 'testURLresults', 'class'))
## Don't show: 
)
## End(Don't show)




