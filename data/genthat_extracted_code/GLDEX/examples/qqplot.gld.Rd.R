library(GLDEX)


### Name: qqplot.gld
### Title: Do a quantile plot on the univariate distribution fits.
### Aliases: qqplot.gld
### Keywords: hplot

### ** Examples

# set.seed(1000)

# junk<-rweibull(300,3,2)

## Fit the function using fun.data.fit.ml
# obj.fit1.ml<-fun.data.fit.ml(junk)

## Do a quantile plot on the raw quantiles
# qqplot.gld(junk,obj.fit1.ml[,1],param="rs",name="RS ML fit")

## Or a qq plot to examine deviation from straight line
# qqplot.gld(junk,obj.fit1.ml[,1],param="rs",name="RS ML fit",type="str.qqplot")



