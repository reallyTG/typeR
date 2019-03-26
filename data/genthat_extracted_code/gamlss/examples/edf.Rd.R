library(gamlss)


### Name: edf
### Title: Effective degrees of freedom from gamlss model
### Aliases: edf edfAll
### Keywords: regression

### ** Examples

library(gamlss.data)
data(usair)
m1<- gamlss(y~pb(x1)+pb(x2)+pb(x6), data=usair)
edfAll(m1)
edf(m1)



