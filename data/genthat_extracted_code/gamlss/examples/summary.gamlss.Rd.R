library(gamlss)


### Name: summary.gamlss
### Title: Summarizes a GAMLSS fitted model
### Aliases: summary.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
summary(h)
rm(h)



