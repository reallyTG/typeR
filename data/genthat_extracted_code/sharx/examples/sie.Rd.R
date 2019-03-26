library(sharx)


### Name: sie
### Title: Small Island Effect (SIE) via Breakpoint Regression
### Aliases: sie-class sie sieplot show,sie-method
### Keywords: htest

### ** Examples

data(sardata)
DAT <- sardata$islands[sardata$islands$study=="abbott1978plant",]
(x <- sie(DAT$S, DAT$A))
coef(x)
summary(x)
sieplot(x)



