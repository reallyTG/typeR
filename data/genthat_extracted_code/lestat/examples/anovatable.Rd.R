library(lestat)


### Name: anovatable
### Title: Computes ANOVA table given data and design
### Aliases: anovatable
### Keywords: ANOVA

### ** Examples

data1 <- simulate(normal(2.7, log(0.7)), 3)
data2 <- simulate(normal(4.0, log(0.7)), 5)
data3 <- simulate(normal(3.2, log(0.7)), 3)
data4 <- simulate(normal(4.1, log(0.7)), 4)
anovatable(c(data1, data2, data3, data4), designManyGroups(c(3,5,3,4)))



