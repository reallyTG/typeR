library(QCAfalsePositive)


### Name: plot.fsQCApt
### Title: Plot Results of fsQCA Permutation Test
### Aliases: plot.fsQCApt
### Keywords: distribution fsQCA permutation test

### ** Examples

data(social.revolutions)
attach(social.revolutions)

intersect <- pmin(breakdown, pop.ins)
intersect2 <- pmin(breakdown, (1-pop.ins))
intersect3 <- pmin((1-breakdown), pop.ins)
intersect4 <- pmin((1-breakdown), (1-pop.ins))

test <- fsQCApermTest(y=soc.rev, configs=list(BI=intersect, Bi=intersect2,
   bI=intersect3, bi=intersect4), total.configs=4)
plot(test)
plot(test, "bi", statistic="consistency")
plot(test, c("BI", "Bi"), statistic="both")
plot(test, statistic="consistency")
plot(test, "BI")



