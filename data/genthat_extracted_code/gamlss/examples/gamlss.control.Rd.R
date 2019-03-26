library(gamlss)


### Name: gamlss.control
### Title: Auxiliary for Controlling GAMLSS Fitting
### Aliases: gamlss.control
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) # 
con<-gamlss.control(mu.step=0.1)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids, control=con) # 
rm(h,con)



