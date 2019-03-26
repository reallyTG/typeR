library(cobalt)


### Name: f.build
### Title: Convenient Formula Generation
### Aliases: f.build

### ** Examples

data(lalonde)
covs <- subset(lalonde, select = -c(treat, re78))
lm(f.build("treat", covs), data = lalonde)



