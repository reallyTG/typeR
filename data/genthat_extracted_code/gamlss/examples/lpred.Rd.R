library(gamlss)


### Name: lpred
### Title: Extract Linear Predictor Values and Standard Errors For A GAMLSS
###   Model
### Aliases: lpred lp
### Keywords: regression

### ** Examples

data(aids)
mod<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
mod.t <- lpred(mod, type = "terms", terms= "qrt")
mod.t
mod.lp <- lp(mod)
mod.lp 
rm(mod, mod.t,mod.lp)



