library(sglr)


### Name: sglr-package
### Title: An R package for power and boundary calculations in
###   pre-licensure vaccine trials using a sequential generalized
###   likelihood ratio test
### Aliases: sglr-package sglr
### Keywords: design

### ** Examples

library(sglr)
result <- glrSearch(p=c(.5, .75), alpha=0.05, beta=0.10)
## print(result)  ## large amounts of output possible!
result[1:3]



