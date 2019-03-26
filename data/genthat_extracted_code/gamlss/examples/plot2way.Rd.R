library(gamlss)


### Name: plot2way
### Title: Function to plot two interaction in a GAMLSS model
### Aliases: plot2way
### Keywords: regression

### ** Examples

data(aids)
ti <- factor(c(rep(1,18),rep(2,27))) 
m1 <- gamlss(y~x+qrt*ti, data=aids, family=NBI)
m2 <- gamlss(y~x+qrt*ti, data=aids, family=NO)
plot2way(m1, c("qrt","ti")) 
plot2way(m1, c("ti", "qrt"))



