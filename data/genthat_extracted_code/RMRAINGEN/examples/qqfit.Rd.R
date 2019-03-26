library(RMRAINGEN)


### Name: qqfit
### Title: Quantile-Quantile Fit between observed data and a parametric
###   probability distribution.
### Aliases: qqfit

### ** Examples

x <- rexp(100,rate=2)
y2 <- qqfit(x,FUN=qexp,list(rate=2))
y4 <- qqfit(x,FUN=qexp,list(rate=4))

qqplot(x,y2)
abline(0,1)

qqplot(x,y4)
abline(0,1)



