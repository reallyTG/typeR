library(hcc)


### Name: tensile
### Title: The tensile strength of Kraft paper measure against the
###   percentage of hardwood
### Aliases: tensile
### Keywords: datasets

### ** Examples

data(tensile)
tmod1 <- lm(Y~x+I(x^2), tensile)
x<-tensile[,2]
res <- resid(tmod1)
hctest(x, res)



