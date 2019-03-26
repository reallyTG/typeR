library(double.truncation)


### Name: NPMLE
### Title: Nonparametric inference based on the self-consistency method
### Aliases: NPMLE
### Keywords: NPMLE ~kwd2

### ** Examples

## A data example from Efron and Petrosian (1999) ## 
y.trunc=c(0.75, 1.25, 1.50, 1.05, 2.40, 2.50, 2.25)
u.trunc=c(0.4, 0.8, 0.0, 0.3, 1.1, 2.3, 1.3)
v.trunc=c(2.0, 1.8, 2.3, 1.4, 3.0, 3.4, 2.6)
NPMLE(u.trunc,y.trunc,v.trunc)



