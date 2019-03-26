library(gamlss)


### Name: pdf.plot
### Title: Plots Probability Distribution Functions for GAMLSS Family
### Aliases: pdf.plot
### Keywords: regression

### ** Examples

pdf.plot(family=BCT, min=1, max=20, step=.05, mu=10, sigma=0.15, nu=-1, tau=c(4,10,20,40) )
# now using an gamlss object
# library(gamlss)
#data(abdom)
#h<-gamlss(y~pb(x), sigma.formula=~pb(x), family=BCT, data=abdom) # fits 
#pdf.plot(obj=h , obs=c(23,67), min=50, max=150, step=.5)



