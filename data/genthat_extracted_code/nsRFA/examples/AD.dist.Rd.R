library(nsRFA)


### Name: AD.dist
### Title: Anderson-Darling distance matrix for growth curves
### Aliases: AD.dist
### Keywords: cluster

### ** Examples

data(hydroSIMN)

annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]

# Ad.dist
AD.dist(x,cod)             # it takes some time



