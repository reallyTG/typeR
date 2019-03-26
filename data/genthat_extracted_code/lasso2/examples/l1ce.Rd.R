library(lasso2)


### Name: l1ce
### Title: Regression Fitting With L1-constraint on the Parameters
### Aliases: l1ce
### Keywords: models optimize regression

### ** Examples

data(Iowa)
l1c.I <- l1ce(Yield ~ ., Iowa, bound = 10, absolute.t=TRUE)
l1c.I

## The same, printing information in each step:
l1ce(Yield ~ ., Iowa, bound = 10, trace = TRUE, absolute.t=TRUE)

data(Prostate)
l1c.P <- l1ce(lpsa ~ ., Prostate, bound=(1:30)/30)
length(l1c.P)# 30 l1ce models
l1c.P # -- MM: too large; should do this in summary(.)!
## Don't show: 
str(l1c.P, max.lev = 1)
## End(Don't show)

plot(resid(l1c.I) ~ fitted(l1c.I))
abline(h = 0, lty = 3, lwd = .2)



