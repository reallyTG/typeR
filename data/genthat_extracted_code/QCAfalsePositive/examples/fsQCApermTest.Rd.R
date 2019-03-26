library(QCAfalsePositive)


### Name: fsQCApermTest
### Title: A Simple Permutation Test for Type I Error in fsQCA
### Aliases: fsQCApermTest
### Keywords: adjust fsQCA inference multiple p-value permutation

### ** Examples

data(social.revolutions)
attach(social.revolutions)

intersect <- pmin(breakdown, pop.ins)
intersect2 <- pmin(breakdown, (1-pop.ins))
intersect3 <- pmin((1-breakdown), pop.ins)
intersect4 <- pmin((1-breakdown), (1-pop.ins))

test <- fsQCApermTest(y=soc.rev, configs=list(BI=intersect, Bi=intersect2,
   bI=intersect3, bi=intersect4), total.configs=4)
summary(test)
plot(test)



