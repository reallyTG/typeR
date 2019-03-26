library(lestat)


### Name: designManyGroups
### Title: Create a Design Matrix for Several Groups of Normal Observations
### Aliases: designManyGroups
### Keywords: One-way ANOVA

### ** Examples

data1 <- simulate(normal(3.3, log(2)), 9)
data2 <- simulate(normal(4.5, log(2)), 8)
data3 <- simulate(normal(2.9, log(2)), 7)
design <- designManyGroups(c(9,8,7))
posterior <- linearmodel(c(data1, data2, data3), design)
plot(posterior)



