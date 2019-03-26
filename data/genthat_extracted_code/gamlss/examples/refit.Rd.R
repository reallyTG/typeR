library(gamlss)


### Name: refit
### Title: Refit a GAMLSS model
### Aliases: refit
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
refit(h)
rm(h)



