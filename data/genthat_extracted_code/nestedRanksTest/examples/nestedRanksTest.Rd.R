library(nestedRanksTest)


### Name: nestedRanksTest
### Title: Mann-Whitney-Wilcoxon ranks test when data are in groups.
### Aliases: nestedRanksTest nestedRanksTest.default
###   nestedRanksTest.formula
### Keywords: htest nonparametric

### ** Examples

require(graphics)

data(woodpecker_multiyear)

## S3 method for class 'formula'

## n.iter set to 1000 to shorten completion time

## group in formula
nestedRanksTest(Distance ~ Year | Granary, n.iter = 1000,
                data = woodpecker_multiyear,
                subset = Species == "agrifolia")
## group in 'groups='
nestedRanksTest(Distance ~ Year, groups = Granary, n.iter = 1000,
                data = woodpecker_multiyear,
                subset = Species == "lobata")

## Default S3 method

dat.a <- subset(woodpecker_multiyear, Species == "agrifolia")
## arguments in default order
nestedRanksTest(dat.a$Year, dat.a$Distance, dat.a$Granary, n.iter = 1000)
## named arguments used in 'formula' order
res <- with(subset(woodpecker_multiyear, Species == "lobata"),
           nestedRanksTest(y = Distance, x = Year, groups = Granary,
                           n.iter = 1000))
plot(res)



