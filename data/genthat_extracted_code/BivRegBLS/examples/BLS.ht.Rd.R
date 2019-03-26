library(BivRegBLS)


### Name: BLS.ht
### Title: Bivariate Least Square regression (BLS)
### Aliases: BLS.ht
### Keywords: BLS Bivariate Least Square heteroscedastic regression
###   confidence region joint confidence interval ellipse

### ** Examples

library(BivRegBLS)
data(SBP)
res.BLS.ht=BLS.ht(data=SBP,xcol=c("J1","J2","J3"),ycol=c("S1","S2","S3"))



