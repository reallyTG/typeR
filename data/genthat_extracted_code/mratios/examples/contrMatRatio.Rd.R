library(mratios)


### Name: contrMatRatio
### Title: Creates numerator and denominator contrast matrices for
###   ratio-based hypotheses for common multiple comparison and trend test
###   problems
### Aliases: contrMatRatio
### Keywords: htest

### ** Examples


library(mratios)

n=c(A=10,B=20,Z=10,D=10)

contrMatRatio(n=n, type="Dunnett", base=1)
contrMatRatio(n=n, type="Dunnett", base=3)

contrMatRatio(n=n, type="Tukey")
contrMatRatio(n=n, type="Sequen")
contrMatRatio(n=n, type="AVE")
contrMatRatio(n=n, type="GrandMean")
contrMatRatio(n=n, type="Williams")
contrMatRatio(n=n, type="UmbrellaWilliams")



