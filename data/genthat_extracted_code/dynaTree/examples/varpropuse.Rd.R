library(dynaTree)


### Name: varpropuse
### Title: Calculate the proportion of variables used in tree splits, and
###   average summary stats of tree heights and leaf sizes
### Aliases: varpropuse.dynaTree varproptotal.dynaTree treestats.dynaTree
### Keywords: method tree

### ** Examples

## ffit a dynaTree model to the Ozone data
X <- airquality[,2:4]
y <- airquality$Ozone
na <- apply(is.na(X), 1, any) | is.na(y)
out <- dynaTree(X=X[!na,], y=y[!na])

## obtain variable usage proportions
varpropuse(out)
varproptotal(out)

## gather relevance statistics which are more meaningful
out <- relevance(out)
boxplot(out$relevance)
abline(h=0, col=2, lty=2)

## obtain tree statistics
treestats(out)

## clean up
deletecloud(out)



