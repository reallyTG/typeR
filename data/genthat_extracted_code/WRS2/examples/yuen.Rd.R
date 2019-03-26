library(WRS2)


### Name: yuen
### Title: Independent samples t-tests on robust location measures
###   including effect sizes.
### Aliases: yuen yuenbt yuenbt pb2gen medpb2 qcomhd akp.effect
###   yuen.effect.ci print.yuen print.pb2
### Keywords: models

### ** Examples

## Yuen's test
yuen(Anxiety ~ Group, data = spider)

## Bootstrap version of Yuen's test (symmetric CIs)
yuenbt(Anxiety ~ Group, data = spider)

## Robust Cohen's delta
akp.effect(Anxiety ~ Group, data = spider)
##

## Using an M-estimator
pb2gen(Anxiety ~ Group, data = spider, est = "mom")
pb2gen(Anxiety ~ Group, data = spider, est = "mean")
pb2gen(Anxiety ~ Group, data = spider, est = "median")

## Using the median
medpb2(Anxiety ~ Group, data = spider)

## Quantiles
set.seed(123)
qcomhd(Anxiety ~ Group, data = spider, q = c(0.8, 0.85, 0.9), nboot = 500)



