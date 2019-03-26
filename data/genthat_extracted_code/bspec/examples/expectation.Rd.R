library(bspec)


### Name: expectation
### Title: Expectations and variances of distributions
### Aliases: expectation variance expectation.bspec expectation.bspecACF
###   variance.bspec variance.bspecACF
### Keywords: ts

### ** Examples

# note the changing expectation
# with increasing prior/posterior degrees-of-freedom:
expectation(bspec(lh))
expectation(bspec(lh, priordf=1, priorscale=0.6))
expectation(bspec(lh, priordf=2, priorscale=0.6))

# similar for variance:
variance(bspec(lh, priordf=2, priorscale=0.6))
variance(bspec(lh, priordf=3, priorscale=0.6))

# and again similar for autocovariances:
expectation(acf(bspec(lh)))
expectation(acf(bspec(lh, priordf=2, priorscale=0.6)))
variance(acf(bspec(lh)))
variance(acf(bspec(lh, priordf=4, priorscale=0.6)))



