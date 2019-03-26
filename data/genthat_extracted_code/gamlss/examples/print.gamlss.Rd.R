library(gamlss)


### Name: print.gamlss
### Title: Prints a GAMLSS fitted model
### Aliases: print.gamlss
### Keywords: regression

### ** Examples

data(aids)
h<-gamlss(y~poly(x,3)+qrt, family=PO, data=aids) 
print(h) # or just h
rm(h)



