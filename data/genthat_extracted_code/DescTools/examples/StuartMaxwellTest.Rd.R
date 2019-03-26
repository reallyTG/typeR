library(DescTools)


### Name: StuartMaxwellTest
### Title: Stuart-Maxwell Marginal Homogeneity Test
### Aliases: StuartMaxwellTest
### Keywords: htest

### ** Examples

hyp <- as.table(matrix(c(20,3,0,10,30,5,5,15,40), nrow=3))
StuartMaxwellTest(hyp)

# Source: http://www.john-uebersax.com/stat/mcnemar.htm#stuart
mc <- as.table(matrix(c(
         732, 1524, 1575, 1577, 1602, 837, 1554, 1437, 
         1672, 1600, 841, 1363, 1385, 1484, 1524, 791), nrow=4))

StuartMaxwellTest(mc)



