library(nsRFA)


### Name: Lmoments
### Title: Hosking and Wallis sample L-moments
### Aliases: Lmoments regionalLmoments LCV LCA Lkur
### Keywords: univar

### ** Examples

x <- rnorm(30,10,2)
Lmoments(x)

data(hydroSIMN)
annualflows
summary(annualflows)
x <- annualflows["dato"][,]
cod <- annualflows["cod"][,]
split(x,cod)
camp <- split(x,cod)$"45"
Lmoments(camp)
sapply(split(x,cod),Lmoments)

regionalLmoments(x,cod)



