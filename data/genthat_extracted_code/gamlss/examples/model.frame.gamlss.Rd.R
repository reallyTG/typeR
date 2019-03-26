library(gamlss)


### Name: model.frame.gamlss
### Title: Extract a model.frame, a model matrix or terms from a GAMLSS
###   object for a given distributional parameter
### Aliases: model.frame.gamlss terms.gamlss model.matrix.gamlss
### Keywords: regression

### ** Examples

data(aids)
mod<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
model.frame(mod)
model.matrix(mod)
terms(mod, "mu")
rm(mod)



