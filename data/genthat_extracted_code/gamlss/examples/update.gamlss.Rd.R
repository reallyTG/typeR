library(gamlss)


### Name: update.gamlss
### Title: Update and Re-fit a GAMLSS Model
### Aliases: update.gamlss
### Keywords: regression

### ** Examples

data(aids)
# fit a poisson model
h.po <-gamlss(y~pb(x)+qrt, family=PO, data=aids) 
# update with a negative binomial
h.nb <-update(h.po, family=NBI) 
# update the smoothing 
h.nb1 <-update(h.nb,~cs(x,8)+qrt) 
# remove qrt
h.nb2 <-update(h.nb1,~.-qrt)
# put back qrt take log of y and fit a normal distribution 
h.nb3 <-update(h.nb1,log(.)~.+qrt, family=NO) 
# verify that it is the same 
h.no<-gamlss(log(y)~cs(x,8)+qrt,data=aids )



