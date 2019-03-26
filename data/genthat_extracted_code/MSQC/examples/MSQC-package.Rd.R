library(MSQC)


### Name: MSQC-package
### Title: Multivariate Statistical Quality Control
### Aliases: MSQC-package MSQC
### Keywords: package

### ** Examples

data(dowel1)
mult.chart(dowel1, type = "chi", alpha = 0.05)

#Phase I
data(carbon1)
mult.chart(type = "t2", carbon1)

#Phase II
Xmv <- mult.chart(carbon1, type = "t2") $Xmv
S <- mult.chart(carbon1, type = "t2") $covariance
colm <- nrow(carbon1)

data(carbon2)
mult.chart(carbon2, type = "t2", Xmv = Xmv, S = S, colm = colm)

# (MEWMA) in Phase II
Xmv <- mult.chart(carbon1, type = "t2") $Xmv
S <- mult.chart(carbon1, type = "t2") $covariance
mult.chart(type = "mewma", carbon2, Xmv = Xmv, S = S)


#Multivariate Cumulative Sum (MCUSUM) in Phase I
mult.chart(type = "mcusum", carbon2)
mult.chart(type = "mcusum2", carbon2)



