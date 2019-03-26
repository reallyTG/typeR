library(gamlss)


### Name: glim.control
### Title: Auxiliary for Controlling the inner algorithm in a GAMLSS
###   Fitting
### Aliases: glim.control
### Keywords: regression

### ** Examples

data(aids)
con<-glim.control(glm.trace=TRUE)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids, i.control=con) # 
rm(h,con)




