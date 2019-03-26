library(gamlss.dist)


### Name: DEL
### Title: The Delaporte distribution for fitting a GAMLSS model
### Aliases: DEL dDEL pDEL qDEL rDEL
### Keywords: distribution regression

### ** Examples

 DEL()# gives information about the default links for the  Delaporte distribution 
#plot the pdf using plot 
plot(function(y) dDEL(y, mu=10, sigma=1, nu=.5), from=0, to=100, n=100+1, type="h") # pdf
# plot the cdf
plot(seq(from=0,to=100),pDEL(seq(from=0,to=100), mu=10, sigma=1, nu=0.5), type="h")   # cdf
# generate random sample
tN <- table(Ni <- rDEL(100, mu=10, sigma=1, nu=0.5))
r <- barplot(tN, col='lightblue')
# fit a model to the data 
# libary(gamlss)
# gamlss(Ni~1,family=DEL, control=gamlss.control(n.cyc=50))



