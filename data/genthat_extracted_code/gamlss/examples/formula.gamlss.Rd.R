library(gamlss)


### Name: formula.gamlss
### Title: Extract the Model Formula in a GAMLSS fitted model
### Aliases: formula.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
formula(h,"mu")
rm(h)



