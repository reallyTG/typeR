library(pdR)


### Name: contts
### Title: Function for extracting components from a lm object
### Aliases: contts

### ** Examples

x=rnorm(100)
y=1+0.2*x+rnorm(100)
LMout=lm(y~x)
contts(LMout,1)

#$se.coef
#[1] 0.1081023

#$t.stat
#(Intercept) 
#   10.60401 




